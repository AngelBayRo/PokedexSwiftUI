//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 25/3/24.
//

import Foundation
import Combine
import SwiftUI
import Observation

@Observable
final class HomeViewModel {
    var data: [PokedexRegionName] = []
    private var cancelBag = Set<AnyCancellable>()
    
    var pokedexListUseCase: PokedexListSelectorUseCase {
        DefaultPokedexListSelectorUseCase()
    }
    
    init() {
        pokedexListUseCase.getPokedexRegions()
            .sink { [weak self] types in
                self?.data = types
            }.store(in: &cancelBag)
    }
}
