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
    @Published var selectedType: PokedexRegionName?
    @Published private(set) var state = Status.loading
    private var suscription: AnyCancellable?
    
    @State private var globalData: GlobalData
    
    var pokemonListUseCase: PokedexListUseCase {
        DefaultPokedexListUseCase()
    }
    
    init(selectedType: PokedexRegionName, globalData: GlobalData) {
        self.selectedType = selectedType
        self.globalData = globalData
        
        if globalData.asyncAwaitEnabled {
            Task {
                await reloadDataAsync()
            }
        } else {
            reloadData()
        }
    }
    
    func reloadData() {
        suscription = getData()
    }
    
    func reloadDataAsync() async {
        await loadPokedexData()
    }
    
    func getData() -> AnyCancellable {
        let range = getPokedexRange(type: selectedType ?? .all)
        let limit = ((selectedType == .all) || (selectedType == .firstGeneration)) ? range.1 : (range.1 - range.0 + 1)
        
        return pokemonListUseCase.getPokedex(limit: String(limit), offset: String((range.0 != 0) ? (range.0 - 1) : range.0))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self.state = .failed
                }
            }, receiveValue: { [weak self] pokemons in
                self?.state = .loaded
                self?.pokemons = pokemons
            })
    }
    
    func loadPokedexData() async {
        let range = getPokedexRange(type: selectedType ?? .all)
        let limit = String(((selectedType == .all) || (selectedType == .firstGeneration)) ? range.1 : (range.1 - range.0 + 1))
        let offset = String((range.0 != 0) ? (range.0 - 1) : range.0)
        
        if let content = await pokemonListUseCase.getPokedexAsync(limit: limit, offset: offset) {
            pokemons = content
            state = .loaded
        } else {
            state = .failed
        }
    }
}
