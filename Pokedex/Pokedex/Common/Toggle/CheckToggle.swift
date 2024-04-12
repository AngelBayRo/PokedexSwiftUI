//
//  CheckToggle.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 10/4/24.
//

import Foundation
import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    var systemImage: String = "ShinyIcon"
    var initialColor: Color = .red
    var activeColor: Color = .blue
 
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
 
            Spacer()
 
            RoundedRectangle(cornerRadius: 30)
                .fill(configuration.isOn ? activeColor : initialColor)
                .overlay {
                    Circle()
                        .fill(.white)
                        .padding(3)
                        .overlay {
                            Image(systemImage)
                                .resizable()
                                .colorMultiply(configuration.isOn ? activeColor : initialColor)
                                .foregroundColor(configuration.isOn ? activeColor : initialColor)
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        .offset(x: configuration.isOn ? 10 : -10)
 
                }
                .frame(width: 50, height: 32)
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}
