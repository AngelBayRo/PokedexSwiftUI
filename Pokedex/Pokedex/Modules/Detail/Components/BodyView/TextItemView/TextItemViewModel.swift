//
//  TextItemViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 10/4/24.
//

import Foundation
import SwiftUI

final class TextItemViewModel: ObservableObject {
    @Published var field: String = "demo"
    @Published var value: String = "demo"
    
    init(field: String, value: String) {
        self.field = field
        self.value = value
    }
}
