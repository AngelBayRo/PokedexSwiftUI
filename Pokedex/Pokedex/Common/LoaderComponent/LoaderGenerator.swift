//
//  LoaderGenerator.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 21/3/24.
//

import Lottie
import SwiftUI

struct LoaderGenerator: UIViewRepresentable {
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView(name: "pokeballWait")
        animationView.play()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}
