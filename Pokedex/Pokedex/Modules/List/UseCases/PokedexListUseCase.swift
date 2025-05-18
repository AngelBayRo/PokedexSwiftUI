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
    func getPokedexAsync(limit: String, offset: String) async -> [PokemonListBOItem]?
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
    
    func getPokedexAsync(limit: String, offset: String) async -> [PokemonListBOItem]? {
        let endpoint = Endpoint.base
        .replacingOccurrences(of: Placeholder.limit.rawValue, with: limit)
        .replacingOccurrences(of: Placeholder.offset.rawValue, with: offset)
        
        let result: Result<PokedexData, Error> = await repository.fetchData(urlPath: endpoint)
        
        switch result {
        case .success(let data):
            return data.results.map { $0.toDO() }
        case .failure(_):
            return nil
        }
    }
}
