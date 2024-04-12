//
//  PokedexListViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 1/4/24.
//

import Foundation
import Combine
import SwiftUI

final class PokedexListViewModel: ObservableObject {
    enum Status {
        case loading
        case failed
        case loaded
    }
    
    @Published var pokemons: [PokemonListBOItem] = []
    @Published var selectedType: PokedexType?
    @Published private(set) var state = Status.loading
    private var suscription: AnyCancellable?
    
    var pokemonListUseCase: PokedexListUseCase {
        DefaultPokedexListUseCase()
    }
    
    init(selectedType: PokedexType) {
        self.selectedType = selectedType
        reloadData()
    }
    
    func reloadData() {
        suscription = getData()
    }
    
    func getData() -> AnyCancellable {
        let range = getPokedexRange(type: selectedType ?? .all)
        let limit = ((selectedType == .all) || (selectedType == .firstGeneration)) ? range.1 : (range.1 - range.0 + 1)
        
        return pokemonListUseCase.getPokedex(limit: String(limit), offset: String((range.0 != 0) ? (range.0 - 1) : range.0))
            .sink(receiveCompletion: { completion in
                switch completion {
                    
                case .finished:
                    break
                case .failure(let error):
                    self.state = .failed
                }
                
                print(completion)
            }, receiveValue: { [weak self] pokemons in
                self?.state = .loaded
                self?.pokemons = pokemons
            })
    }
}
