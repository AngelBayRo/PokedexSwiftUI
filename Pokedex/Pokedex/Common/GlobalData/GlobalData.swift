//
//  GlobalData.swift
//  Pokedex
//
//  Created by Ángel Luis Bayón Romero on 5/1/25.
//

import SwiftUI

// Modelo de datos compartido
class GlobalData: ObservableObject {
    @Published var asyncAwaitEnabled = false
}
