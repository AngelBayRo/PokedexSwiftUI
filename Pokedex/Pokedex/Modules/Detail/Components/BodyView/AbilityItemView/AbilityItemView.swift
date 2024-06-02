//
//  AbilityItemView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 11/4/24.
//

import SwiftUI

struct AbilityItemView: View {
    @ObservedObject var viewModel: AbilityItemViewModel
    
    var body: some View {
        contentView()
    }
    
    //ContentView
    @ViewBuilder
    func contentView() -> some View {
        let text = viewModel.representable.isHidden ? "hidden" : "normal"
        
        Group {
            TextItemView(viewModel: TextItemViewModel(field: viewModel.representable.ability.name,
                                                      value: text.capitalized))
        }
    }
}

#Preview {
    AbilityItemView(viewModel: AbilityItemViewModel(ability: AbilityRepresentable(ability: FormRepresentable(name: "demodemodemodemodemo", url: "url"), isHidden: false, slot: 0)))
}
