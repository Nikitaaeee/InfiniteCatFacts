//
//  CatFactDTO.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 08.03.2023.
//

import Foundation

struct CatFactDTO: Decodable {
    let id: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case text
    }
}
