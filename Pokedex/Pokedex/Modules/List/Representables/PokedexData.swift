//
//  PokedexData.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 1/4/24.
//

import Foundation

// MARK: - PokedexData
struct PokedexData: Decodable {
    let count: Int
    let next, previous: String?
    let results: [PokemonIdentifier]
}
