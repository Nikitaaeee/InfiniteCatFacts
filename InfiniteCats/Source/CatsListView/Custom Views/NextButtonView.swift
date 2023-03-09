//
//  NextButtonView.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 09.03.2023.
//

import SwiftUI

struct NextButtonView: View {
    
    //MARK: - Properties
    
    private let action: () -> Void
    
    //MARK: - Lifecycle
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    //MARK: - Views
    
    var body: some View {
        Button(action: action) {
            Text(Constants.buttonTitle)
                .font(.headline)
                .foregroundColor(.black)
                .padding()
                .background(Color.white.opacity(Constants.buttonOpacity))
                .clipShape(Circle())
                .scaleEffect(Constants.buttonScale)
        }
    }
}

//MARK: - Constants

private extension NextButtonView {
    enum Constants {
        static let buttonTitle: String = "Next"
        static let buttonOpacity: Double = 0.95
        static let buttonScale: CGFloat = 1.4
    }
}
