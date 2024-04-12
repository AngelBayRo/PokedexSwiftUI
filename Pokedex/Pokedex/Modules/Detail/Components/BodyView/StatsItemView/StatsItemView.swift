//
//  StatsItemView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 11/4/24.
//

import SwiftUI

struct StatsItemView: View {
    @ObservedObject var viewModel: StatsItemViewModel
    
    var body: some View {
        LazyVStack {
            ForEach(viewModel.representable) { stat in
                StatView(baseValue: stat.baseStat, baseEffor: stat.effort, name: stat.stat.name)
                    .padding(.horizontal, 12)
            }
        }
    }
}

#Preview {
    StatsItemView(viewModel: StatsItemViewModel(stats: [
        StatRepresentable(baseStat: 64, effort: 32, stat: FormRepresentable(name: "name", url: "url")),
        StatRepresentable(baseStat: 64, effort: 32, stat: FormRepresentable(name: "attack", url: "url"))]))
}
