//
//  PokemonIdentifier.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 1/4/24.
//

import Foundation

// MARK: - PokemonIdentifier
public struct PokemonIdentifier: Decodable {
    let name: String
    let url: String
}

extension PokemonIdentifier {
    public func toDO() -> PokemonListBOItem {
        return PokemonListBOItem(name: name, url: url)
    }
}
