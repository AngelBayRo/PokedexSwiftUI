//
//  ErrorView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 4/4/24.
//

import SwiftUI

struct ErrorView: View {
    @State var action: () -> ()
    
    var body: some View {
        Group {
            errorView()
        }.background(
            Image("ErrorBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.3)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 4)
                )
        )
    }
    
    //OptionsView
    @ViewBuilder
    func errorView() -> some View {
        VStack(spacing: 24) {
            Text("Ha ocurrido un error!")
                .foregroundStyle(.red)
                .fontWeight(.black)
            Button(action: action) {
                Text("Reintentar")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
            }
        }
        .frame(height: 300)
        .padding(15)
        
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 300)) {
    ErrorView(action: {})
}
