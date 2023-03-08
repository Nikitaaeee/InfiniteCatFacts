//
//  ContentView.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 18.02.2023.
//

import SwiftUI

struct CatFactScreenView: View {
    
    //MARK: - Properties
    
    @ObservedObject var viewModel = CatsCellViewModel()
    private var url: String = ""
    
    //MARK: - Views
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    CatCellView(
                        catImage: viewModel.catImage,
                        catFact: viewModel.catFact
                    )
                    .padding(.horizontal, 10)
                }
                Button(action: {
                    viewModel.isLoading = true
                    viewModel.fetchCatInfo()
                }) {
                    Text("Next fact")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }.navigationTitle("Random Cat Facts")
        }
        .onAppear() {
            viewModel.fetchCatInfo()
        }
    }
}

//MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactScreenView()
    }
}
