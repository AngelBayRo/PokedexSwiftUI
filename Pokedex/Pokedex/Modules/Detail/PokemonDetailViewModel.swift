//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 9/4/24.
//

import Foundation
import SwiftUI

final class PokemonDetailViewModel: ObservableObject {
    @Published var pokemon: PokemonDataRepresentable
    @Published var isShinyEnabled: Bool = false
    
    init(pokemon: PokemonDataRepresentable) {
        self.pokemon = pokemon
    }
}
