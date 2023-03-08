//
//  Color + Extension.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 08.03.2023.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
