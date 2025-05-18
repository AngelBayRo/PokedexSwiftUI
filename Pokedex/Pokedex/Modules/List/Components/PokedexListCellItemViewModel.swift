//
//  PokedexListCellItemViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 8/4/24.
//

import Foundation
import Combine

class PokedexListCellItemViewModel: ObservableObject {
    @Published var pokemon: PokemonListBOItem
    @Published var pokemonDataComplete: PokemonDataRepresentable?
    private var suscription: AnyCancellable?
    
    var getPokemonDataUseCase: GetPokemonDataUseCase {
        DefaultGetPokemonDataUseCase()
    }
    
    init(pokemon: PokemonListBOItem,
         pokemonDataComplete: PokemonDataRepresentable? = nil) {
        self.pokemon = pokemon
        self.pokemonDataComplete = pokemonDataComplete
        
        suscription = getPokemonData(identifier: pokemon)
    }
    
    func getPokemonData(identifier: PokemonListBOItem) -> AnyCancellable {
        return getPokemonDataUseCase.getPokemonData(path: identifier.url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { [weak self] pokemonData in
                self?.pokemonDataComplete = pokemonData
            })
    }
}
