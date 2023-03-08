//
//  CatNetworkManeger.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 18.02.2023.
//

import Foundation

enum CatEndpoint {
    case catImage
    case catFact
}

extension CatEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .catImage:
            guard let url = URL(string: "https://api.thecatapi.com/v1/images/search")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            
            return request
            
        case .catFact:
            guard let url = URL(string: "https://cat-fact.herokuapp.com/facts/random")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            
            return request
        }
    }
}
