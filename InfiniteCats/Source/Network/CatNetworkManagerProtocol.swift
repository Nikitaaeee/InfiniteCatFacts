//
//  CatNetworkManager.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 18.02.2023.
//

import Foundation
import Combine
import UIKit

protocol CatNetworkManagerProtocol {
    var networkService: NetworkServiceProtocol { get }
    func getCatImageURL() -> AnyPublisher<Welcome, APIError>
    func getCatImage(url:String) -> AnyPublisher<UIImage, APIError>
    func getCatFact() -> AnyPublisher<CatFactDTO, APIError>
}

//MARK: - Default Implementation

extension CatNetworkManagerProtocol {
    func getCatImageURL() -> AnyPublisher<Welcome, APIError> {
        return networkService.request(with: CatEndpoint.catImage)
            .eraseToAnyPublisher()
    }
    
    func getCatImage(url:String) -> AnyPublisher<UIImage, APIError> {
        return networkService.requestImage(with: url)
            .eraseToAnyPublisher()
    }
    
    func getCatFact() -> AnyPublisher<CatFactDTO, APIError> {
        return networkService.request(with: CatEndpoint.catFact)
            .eraseToAnyPublisher()
    }
}
