//
//  CatImageDTO.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 08.03.2023.
//

import Foundation

struct CatImageDto: Codable {
    let id: String
    let url: String
    let width, height: Int
}

typealias CatImageDtoResponse = [CatImageDto]
