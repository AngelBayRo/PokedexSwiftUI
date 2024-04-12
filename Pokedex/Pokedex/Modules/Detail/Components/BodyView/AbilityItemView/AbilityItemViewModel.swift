//
//  AbilityItemViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 11/4/24.
//

import Foundation
import SwiftUI

final class AbilityItemViewModel: ObservableObject {
    @Published var representable: AbilityRepresentable = AbilityRepresentable(ability: FormRepresentable(name: "name", url: "url"), isHidden: false, slot: 0)
    
    init(ability: AbilityRepresentable) {
        self.representable = ability
    }
}
