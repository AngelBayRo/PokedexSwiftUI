//
//  PokedexListSelectorUseCase.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 27/3/24.
//

import Foundation
import Combine

public protocol PokedexListSelectorUseCase {
    func getPokedexTypes() -> AnyPublisher<[PokedexType], Never>
}

struct DefaultPokedexListSelectorUseCase: PokedexListSelectorUseCase {
    func getPokedexTypes() -> AnyPublisher<[PokedexType], Never> {
        Just(PokedexType.allCases).eraseToAnyPublisher()
    }
}
