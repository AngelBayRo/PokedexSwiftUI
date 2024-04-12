//
//  Endpoint.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 21/3/24.
//

import Foundation

enum Placeholder: String {
    case limit = "{{LIMIT}}"
    case offset = "{{OFFSET}}"
}

struct Endpoint {
    static let base = "https://pokeapi.co/api/v2/pokemon/?limit={{LIMIT}}&offset={{OFFSET}}"
}
