//
//  PokedexListUseCase.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 1/4/24.
//

import Foundation
import Combine

public protocol PokedexListUseCase {
    func getPokedex(limit: String, offset: String) -> AnyPublisher<[PokemonListBOItem], Error>
}

class DefaultPokedexListUseCase: PokedexListUseCase {
    let repository: PokedexRepository = PokedexRepository()
    
    func getPokedex(limit: String, offset: String) -> AnyPublisher<[PokemonListBOItem], Error> {
        let endpoint = Endpoint.base
        .replacingOccurrences(of: Placeholder.limit.rawValue, with: limit)
        .replacingOccurrences(of: Placeholder.offset.rawValue, with: offset)
        
        return repository.getData(urlPath: endpoint, type: PokedexData.self)
            .map { data in
                data.results.map { $0.toDO() }
            }.eraseToAnyPublisher()
    }
}
