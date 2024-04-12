//
//  BackButtonView.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 8/4/24.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.title3)
                .foregroundColor(.primary)
            Image("BackImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 44)
        }.onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        .frame(width: 90, height: 80)
        .ignoresSafeArea()
    }
}

#Preview(traits: .fixedLayout(width: 90, height: 80)) {
    BackButtonView()
}
