//
//  StatsItemViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 11/4/24.
//

import Foundation
import SwiftUI

final class StatsItemViewModel: ObservableObject {
    @Published var representable: [StatRepresentable] = [StatRepresentable(baseStat: 64, effort: 32, stat: FormRepresentable(name: "stat", url: "url"))]
    
    init(stats: [StatRepresentable]) {
        self.representable = stats
    }
}
