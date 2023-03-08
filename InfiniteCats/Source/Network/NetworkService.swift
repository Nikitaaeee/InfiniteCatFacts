//
//  NetworkService.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 18.02.2023.
//

import Foundation
import Combine
import UIKit

protocol NetworkServiceProtocol {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
    func requestImage(with url: String) -> AnyPublisher<UIImage, APIError>
}

struct NetworkService: NetworkServiceProtocol {
    
    //MARK: - Generic Request
    
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T: Decodable {
        let decoder = JSONDecoder()
        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError {_ in .decodingError}
                            .eraseToAnyPublisher()
                    } else {
                        
                        return Fail(error: APIError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    //MARK: - Image Loader

    func requestImage(with url: String) -> AnyPublisher<UIImage, APIError> {
        guard let url = URL(string: url)
        else {
            return Fail(error: .decodingError)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<UIImage, APIError> in
                if let image = UIImage(data: data) {
                    return Just(image)
                        .mapError {_ in .decodingError }
                        .eraseToAnyPublisher()
                }
                return Fail(error: .unknown)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
