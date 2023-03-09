//
//  BackgroundView.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 09.03.2023.
//

import SwiftUI

struct BackgroundView: View {
    
    //MARK: - Views
    
    var body: some View {
        Image("backgroundCats")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .opacity(Constants.backgroundOpacity)
    }
}

//MARK: - Private

private extension BackgroundView {
    enum Constants {
        static let backgroundOpacity: Double = 0.4
    }
}
