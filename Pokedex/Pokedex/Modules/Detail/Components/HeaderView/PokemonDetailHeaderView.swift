//
//  PokemonDetailHeaderView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 10/4/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct PokemonDetailHeaderView: View {
    @ObservedObject var viewModel: PokemonDetailHeaderViewModel
    
    var body: some View {
        headerView()
            .frame(width: 300)
    }
    
    //HeaderView
    @ViewBuilder
    func headerView() -> some View {
        ZStack {
            VStack {                
                Toggle(isOn: $viewModel.isShinyEnabled) { }
                    .toggleStyle(CheckToggleStyle(systemImage: "ShinyIcon",
                                                  initialColor: viewModel.initialColor,
                                                  activeColor: viewModel.averageColor))
                    .padding(.trailing, -20)
                Spacer()
                ZStack(alignment: .bottomTrailing) {
                    if viewModel.isShinyEnabled {
                        getTinyImageBackShiny()
                            .padding(.leading, -240)
                        
                    } else {
                        getTinyImageBack()
                            .padding(.leading, -240)
                    }
                }
                .padding()
            }
        }
        .frame(height: 300)
        .background() {
            if viewModel.isShinyEnabled {
                getBigImageBackShiny()
                    .opacity(0.3)
            } else {
                getBigImageBack()
                    .opacity(0.3)
            }
        }
    }
    
    //Images
    func getBigImageBack() -> some View {
        AsyncImage(url: URL(string: viewModel.pokemon.sprites.other.officialArtwork.frontDefault)) { image in
            image
                .resizable()
                .scaledToFit()
                .padding(-20)
        } placeholder: {
            ProgressView()
        }
    }
    
    func getTinyImageBack() -> some View {
        AsyncImage(url: URL(string: viewModel.pokemon.sprites.frontDefault)) { image in
            image.resizable()
            image.aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .frame(height: 50)
        .scaleEffect(x: -1, y: 1)
    }
    
    func getBigImageBackShiny() -> some View {
        AsyncImage(url: URL(string: viewModel.pokemon.sprites.other.officialArtwork.frontShiny ?? "")) { image in
            image
                .resizable()
                .scaledToFit()
                .padding(-20)
        } placeholder: {
            ProgressView()
        }
    }
    
    func getTinyImageBackShiny() -> some View {
        AsyncImage(url: URL(string: viewModel.pokemon.sprites.frontShiny ?? "")) { image in
            image.resizable()
            image.aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .frame(height: 50)
        .scaleEffect(x: -1, y: 1)
    }
}

#Preview {
    PokemonDetailHeaderView(viewModel: PokemonDetailHeaderViewModel(pokemon: PokemonDataRepresentable()))
}
