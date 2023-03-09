//
//  CatFactView.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 18.02.2023.
//

import SwiftUI

struct CatFactView: View {
    
    //MARK: - Properties
    
    @ObservedObject var viewModel = CatFactViewModel()
    
    //MARK: - Views
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                
                BackgroundView()
                
                ScrollView {
                    VStack(spacing: Constants.verticalSpacing) {
                        
                        Spacer()
                            .frame(height: Constants.topSpacerHeight)
                        
                        CatCellView(
                            catImage: viewModel.catImage,
                            catFact: viewModel.catFact
                        )
                        .padding(.horizontal, Constants.horizontalPadding)
                        
                        Spacer()
                            .frame(height: Constants.bottomSpacerHeight)
                    }
                    .padding(.bottom, Constants.scrollViewBottomPadding)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    NextButtonView {
                        viewModel.fetchCatInfo()
                    }
                    .padding(.bottom, Constants.buttonBottomPadding)
                }
            }
            .navigationTitle(Constants.navigationTitle)
        }
        .onAppear() {
            viewModel.fetchCatInfo()
        }
    }
}

//MARK: - Constants

private extension CatFactView {
    enum Constants {
        static let navigationTitle = "Random Cat Facts"
        static let topSpacerHeight: CGFloat = 50
        static let horizontalPadding: CGFloat = 10
        static let bottomSpacerHeight: CGFloat = 100
        static let verticalSpacing: CGFloat = 10
        static let scrollViewBottomPadding: CGFloat = 150
        static let buttonBottomPadding: CGFloat = 50
    }
}

//MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactView()
    }
}
