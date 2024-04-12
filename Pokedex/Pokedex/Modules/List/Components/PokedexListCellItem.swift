//
//  PokedexListCellItem.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 8/4/24.
//

import SwiftUI

struct PokedexListCellItem: View {
    @ObservedObject var viewModel: PokedexListCellItemViewModel
    let textExample = ""
    
    var body: some View {
        NavigationLink(destination: PokemonDetailView(viewModel: PokemonDetailViewModel(pokemon: viewModel.pokemonDataComplete ?? PokemonDataRepresentable()))) {
            HStack {
                HStack {
                    Text("    #" + String(viewModel.pokemonDataComplete?.identifier ?? 0))
                    Text(viewModel.pokemonDataComplete?.name.capitalized ?? textExample)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    if let url = viewModel.pokemonDataComplete?.sprites.frontDefault {
                        AsyncImage(url: URL(string: url)) { image in
                            image.resizable()
                            image.aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                    }
                }
                .frame(height: 50, alignment: .trailing)
            }
            .background(
                Image("ErrorBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.3)
            )
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 50)) {
    PokedexListCellItem(viewModel: PokedexListCellItemViewModel(pokemon: PokemonListBOItem(name: "name", url: "url")))
}
