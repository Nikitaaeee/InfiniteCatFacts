//
//  ContentView.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 18.02.2023.
//

import SwiftUI

struct CatFactScreenView: View {
    @ObservedObject var viewModel = CatsCellViewModel()
//    @State private var zoomed: Bool = false
    @State private var isLoading = true
    private var url: String = ""
    
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
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                Button(action: {
                    isLoading = true
                    viewModel.getCatImageURL()
                    viewModel.getCatFact()
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
            isLoading = true
            viewModel.getCatImageURL()
            viewModel.getCatFact()
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactScreenView()
    }
}
