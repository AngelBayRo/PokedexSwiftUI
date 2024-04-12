//
//  TextItemView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 10/4/24.
//

import SwiftUI

struct TextItemView: View {
    @ObservedObject var viewModel: TextItemViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.field)
                .font(.headline)
                .padding(.leading, 20)
            Spacer()
            Text(viewModel.value)
                .padding(.trailing, 20)
                .italic()
                .foregroundStyle(.gray)
        }
        .padding(.bottom, 12)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.black),
            alignment: .bottom
        )
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 50)) {
    TextItemView(viewModel: TextItemViewModel(field: "demo", value: "tuvieja2"))
}
