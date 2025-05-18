//
//  PokedexRegionName.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 21/3/24.
//

import Foundation

public enum PokedexRegionName: String, CaseIterable {
    case all = "Nacional"
    case firstGeneration = "Kanto"
    case secondGeneration = "Johto"
    case thirdGeneration = "Hoenn"
    case fourthGeneration = "Sinnoh"
    case fifthGeneration = "Teselia"
    case sixthGeneration = "Kalos"
    case seventhGeneration = "Alola"
    case eighthGeneration = "Galar/Hisui"
    case ninethGeneration = "Paldea"
}

public func getPokedexRange(type: PokedexRegionName) -> (Int, Int) {
    switch type {
    case .all: return (0, 1025)
    case .firstGeneration: return (0, 151)
    case .secondGeneration: return (152, 251)
    case .thirdGeneration: return (252, 386)
    case .fourthGeneration: return (387, 493)
    case .fifthGeneration: return (494, 649)
    case .sixthGeneration: return (650, 721)
    case .seventhGeneration: return (722, 809)
    case .eighthGeneration: return (810, 905)
    case .ninethGeneration: return (906, 1025)
    }
}
