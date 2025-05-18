//
//  PokedexListSelectorUseCase.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 27/3/24.
//

import Foundation
import Combine

public protocol PokedexListSelectorUseCase {
    func getPokedexRegions() -> AnyPublisher<[PokedexRegionName], Never>
}

struct DefaultPokedexListSelectorUseCase: PokedexListSelectorUseCase {
    func getPokedexRegions() -> AnyPublisher<[PokedexRegionName], Never> {
        Just(PokedexRegionName.allCases).eraseToAnyPublisher()
    }
}
