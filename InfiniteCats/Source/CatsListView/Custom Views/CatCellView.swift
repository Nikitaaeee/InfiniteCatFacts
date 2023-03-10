//
//  CatCellView.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 08.03.2023.
//

import SwiftUI

struct CatCellView: View {
    
    //MARK: - Properties
    
    private var catImage: UIImage?
    private var catFact: String?
    
    //MARK: - Lifecycle
    
    init(catImage: UIImage?, catFact: String?) {
        self.catImage = catImage
        self.catFact = catFact
    }
    
    //MARK: - Views
    
    var body: some View {
        VStack {
            Spacer()
            if let image = catImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(Constants.cornerRadius)
                    .frame(height: Constants.imageHeight)
            } else {
                Image(systemName: Constants.defaultImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(Constants.cornerRadius)
                    .frame(height: Constants.imageHeight)
            }
            
            if let fact = catFact {
                Text(fact)
            } else {
                Text(Constants.defaultText)
            }
            
            Spacer()
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .background(Color.random.opacity(Constants.backgroundOpacity))
        .cornerRadius(Constants.cornerRadius)
    }
}

//MARK: - Private

private extension CatCellView {
    enum Constants {
        static let defaultImageName = "defaultCat"
        static let defaultText = "loading..."
        static let imageHeight: CGFloat = 300
        static let cornerRadius: CGFloat = 16
        static let horizontalPadding: CGFloat = 10
        static let backgroundOpacity: Double = 0.3
    }
}
