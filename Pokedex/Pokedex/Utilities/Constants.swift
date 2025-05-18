//
//  Constants.swift
//  Pokedex
//
//  Created by Ángel Luis Bayón Romero on 5/1/25.
//

import SwiftUI

private struct PokedexStringsKey: EnvironmentKey {
    static let defaultValue: PokedexStrings = PokedexStrings()
}

struct PokedexStrings {
    let appTitle: String = "Pokedex"
    let fontName: String = "Pokemon Hollow"
    let acceptButtonText: String = "Aceptar"
    let toggleAsyncTitle: String = "Async"
}

extension EnvironmentValues {
    var pokedexStrings: PokedexStrings {
        get { self[PokedexStringsKey.self] }
        set { self[PokedexStringsKey.self] = newValue }
    }
}
