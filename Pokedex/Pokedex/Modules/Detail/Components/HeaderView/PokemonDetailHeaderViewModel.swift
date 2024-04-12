//
//  PokemonDetailHeaderViewModel.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 10/4/24.
//

import Foundation
import SwiftUI

final class PokemonDetailHeaderViewModel: ObservableObject {
    @Published var pokemon: PokemonDataRepresentable
    @Published var isShinyEnabled: Bool = false
    @Published var initialColor: Color = .blue
    @Published var averageColor: Color = .green
    
    init(pokemon: PokemonDataRepresentable) {
        self.pokemon = pokemon
        self.getInitialColor()
        self.getAverageColor()
    }
    
    func getAverageColor() {
        guard let url = URL(string: pokemon.sprites.frontShiny ?? "") else {
            self.pokemon.sprites.frontShiny = self.pokemon.sprites.frontDefault
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, self != nil else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data) ?? UIImage()
                let colors = image.getColors()
                let selected = (colors?.primary.cgColor.components?.first != 0) ? colors?.primary : colors?.secondary
                self?.averageColor = Color(selected ?? .black)
            }
        }
        task.resume()
    }
    
    func getInitialColor() {
        guard let url = URL(string: pokemon.sprites.frontDefault) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, self != nil else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data) ?? UIImage()
                let colors = image.getColors()
                let selected = (colors?.primary.cgColor.components?.first != 0) ? colors?.primary : colors?.secondary
                self?.initialColor = Color(selected ?? .black)
            }
        }
        task.resume()
    }
}
