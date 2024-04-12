//
//  PokedexTypeSelectorView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 21/3/24.
//

import SwiftUI

struct PokedexTypeSelectorView: View {
    @Environment(\.colorScheme) private var scheme
    
    let text: String
    
    var body: some View {
        GeometryReader(content: { geometry in
            let size = geometry.size
            HStack {
                Text(text)
                    .padding()
            }
            .padding(.horizontal, 15)
            .frame(width: size.width, height: size.height)
            .containerShape(.rect)
        })
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 40)) {
    PokedexTypeSelectorView(text: "demo")
}
