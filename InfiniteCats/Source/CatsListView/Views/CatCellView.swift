//
//  CatCellView.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 08.03.2023.
//

import SwiftUI

struct CatCellView: View {
    private var catImage: UIImage?
    private var catFact: String?
    
    
    init(catImage: UIImage?, catFact: String?) {
        self.catImage = catImage
        self.catFact = catFact
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: catImage ?? UIImage(systemName: "eye")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
            Text(catFact ?? "No Cat Fact")
            Spacer()
        }
        .padding(.horizontal, 10)
        .frame(height: 300)
        .background(Color.random.opacity(0.3))
        .cornerRadius(16)
    }
}
