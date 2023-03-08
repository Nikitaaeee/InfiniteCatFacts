//
//  CatImageDTO.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 08.03.2023.
//

import Foundation

//struct CatImageDTO: Decodable {
//    let id: String
//    let url: String
//}
struct WelcomeElement: Codable {
    let id: String
    let url: String
    let width, height: Int
}

typealias Welcome = [WelcomeElement]
