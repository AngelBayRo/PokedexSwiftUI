//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 9/4/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel
    
    var body: some View {
        contentView()
            .navigationBarBackButtonHidden()
    }
    
    //ContentView
    @ViewBuilder
    func contentView() -> some View {
        LazyVStack {
            ScrollView {
                PokemonDetailHeaderView(viewModel: PokemonDetailHeaderViewModel(pokemon: viewModel.pokemon))
                PokemonDetailBodyView(viewModel: PokemonDetailBodyViewModel(pokemon: viewModel.pokemon))
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView()
                    .frame(width: 90, height: 80)
            }
            ToolbarItem(placement: .principal) {
                Text(viewModel.pokemon.name.capitalized).font(.custom("Pokemon Hollow", size: 24))
            }
        }
    }
    
}

#Preview(traits: .fixedLayout(width: .infinity, height: 200)) {
    PokemonDetailView(viewModel: PokemonDetailViewModel(pokemon: PokemonDataRepresentable()))
}
