//
//  CatsCellViewModel.swift
//  InfiniteCats
//
//  Created by Nikita Kirshin on 18.02.2023.
//

import SwiftUI
import Combine

final class CatsCellViewModel: ObservableObject, CatNetworkManagerProtocol {
    
    //MARK: - Properties
    
    var networkService: NetworkServiceProtocol
    @Published var catImage: UIImage?
    @Published var catFact: String?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Lifecycle
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchCatInfo() {
        getCatImageURL()
        getCatFact()
    }
}

//MARK: - Private

private extension CatsCellViewModel {
    func getCatImageURL() {
        let cancellable = self.getCatImageURL()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }) { [weak self] model in
                self?.getCatImage(url: model[0].url)
            }
        cancellables.insert(cancellable)
    }

    func getCatFact() {
        let cancellable = self.getCatFact()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }) { [weak self] model in
                self?.catFact = model.text
            }
        cancellables.insert(cancellable)
    }

    func getCatImage(url: String){
        let cancellable = self.getCatImage(url: url)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }) { [weak self] image in
                self?.catImage = image
            }
        cancellables.insert(cancellable)
    }
}
