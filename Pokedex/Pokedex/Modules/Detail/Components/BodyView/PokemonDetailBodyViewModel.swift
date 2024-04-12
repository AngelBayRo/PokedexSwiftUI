//
//  PokemonDetailBodyViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 11/4/24.
//

import Foundation

import SwiftUI

final class PokemonDetailBodyViewModel: ObservableObject {
    @Published var pokemon: PokemonDataRepresentable
    
    init(pokemon: PokemonDataRepresentable) {
        self.pokemon = pokemon
    }
}
