//
//  APIError.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 18.02.2023.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
