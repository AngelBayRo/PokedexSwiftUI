//
//  GetPokemonDataUseCase.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 8/4/24.
//

import Foundation
import Combine

public protocol GetPokemonDataUseCase {
    func getPokemonData(path: String) -> AnyPublisher<PokemonDataRepresentable, Error>
}

class DefaultGetPokemonDataUseCase: GetPokemonDataUseCase {
    let repository: PokedexRepository = PokedexRepository()
    
    func getPokemonData(path: String) -> AnyPublisher<PokemonDataRepresentable, Error> {
        return repository.getData(urlPath: path, type: PokemonData.self)
            .map { $0.toDO() }.eraseToAnyPublisher()
    }
}
