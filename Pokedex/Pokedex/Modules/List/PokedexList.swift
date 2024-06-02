//
//  PokedexList.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 1/4/24.
//

import SwiftUI

struct PokedexList: View {
    @Binding var selectedType: PokedexType
    @ObservedObject var viewModel: PokedexListViewModel
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                LoadingView().transition(AnyTransition.opacity.animation(.easeOut(duration: 1.0)))
            case .failed:
                ErrorView(action: { viewModel.reloadData() })
            case .loaded:
                contentView()
            }
        }.navigationBarBackButtonHidden()
    }
    
    //ContentView
    @ViewBuilder
    func contentView() -> some View {
        Group {
            listView(viewModel.pokemons)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView()
                    .frame(width: 90, height: 80)
            }
            ToolbarItem(placement: .principal) {
                Text(selectedType.rawValue).font(.custom("Pokemon Hollow", size: 24))
            }
        }
    }
    
    //ListView
    @ViewBuilder
    func listView(_ types: [PokemonListBOItem]) -> some View {
        List {
            ForEach(viewModel.pokemons) { pokemon in
                ZStack {
                    let item = PokedexListCellItemViewModel(pokemon: pokemon)
                    PokedexListCellItem(viewModel: item)
                        .listRowInsets(EdgeInsets())
                }.dynamicTypeSize(.xxxLarge)
            }
        }
    }
}

#Preview {
    PokedexList(selectedType: .constant(.firstGeneration), viewModel: PokedexListViewModel(selectedType: .secondGeneration))
}
