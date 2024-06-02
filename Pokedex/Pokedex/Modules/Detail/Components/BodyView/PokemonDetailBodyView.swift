//
//  PokemonDetailBodyView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 11/4/24.
//

import SwiftUI

struct PokemonDetailBodyView: View {
    @ObservedObject var viewModel: PokemonDetailBodyViewModel
    
    var body: some View {
        contentView().navigationBarBackButtonHidden()
    }
    
    //ContentView
    @ViewBuilder
    func contentView() -> some View {
        Group {
            abilitiesView()
            statsView()
        }
    }
    
    //AbilitiesView
    @ViewBuilder
    func abilitiesView() -> some View {
        VStack {
            LazyHStack {
                Text("Abilities")
                    .font(.title)
            }
            Divider()
            ForEach(viewModel.pokemon.abilities) { ability in
                ZStack {
                    let item = AbilityItemViewModel(ability: ability)
                    AbilityItemView(viewModel: item)
                        .listRowInsets(EdgeInsets())
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }
    
    //StatsView
    @ViewBuilder
    func statsView() -> some View {
        LazyVStack {
            LazyHStack {
                Text("Stats")
                    .font(.title)
                Spacer()
            }
            Divider()
            StatsItemView(viewModel: StatsItemViewModel(stats: viewModel.pokemon.stats))
        }
    }
}

#Preview {
    PokemonDetailBodyView(viewModel: PokemonDetailBodyViewModel(pokemon: PokemonDataRepresentable()))
}
