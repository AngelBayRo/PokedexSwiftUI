//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 25/3/24.
//

import Foundation
import Combine
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var data: [PokedexType] = []
    private var cancelBag = Set<AnyCancellable>()
    
    var pokedexListUseCase: PokedexListSelectorUseCase {
        DefaultPokedexListSelectorUseCase()
    }
    
    init() {
        pokedexListUseCase.getPokedexTypes()
            .sink { [weak self] types in
                self?.data = types
            }.store(in: &cancelBag)
    }
}
