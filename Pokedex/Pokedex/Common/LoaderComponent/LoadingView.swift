//
//  LoadingView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 21/3/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack {
            LoaderGenerator(loopMode: .loop)
                .scaleEffect(0.7)
        }
    }
}

#Preview {
    LoadingView()
}
