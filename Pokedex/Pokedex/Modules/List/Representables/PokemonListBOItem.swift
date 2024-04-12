//
//  PokemonListBOItem.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 8/4/24.
//

import Foundation

// MARK: - PokemonListBOItem
public struct PokemonListBOItem: Identifiable {
    public var id = UUID()
    let name: String
    let url: String
}
