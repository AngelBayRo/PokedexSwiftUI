//
//  StatView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 11/4/24.
//

import SwiftUI

struct StatView: View {
    @State var baseValue: Int
    @State var baseEffor: Int
    @State var name: String
    
    var body: some View {
        HStack {
            Text(name.uppercased())
                .font(.headline)
            Spacer()
            Text("\(baseValue)")
            Text("+ \(baseEffor)/lvl")
                .padding(.trailing, 20)
                .italic()
                .foregroundStyle(.gray)
        }
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 40)) {
    StatView(baseValue: 150, baseEffor: 2, name: "hp")
}
