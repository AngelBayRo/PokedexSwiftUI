//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 21/3/24.
//

import SwiftUI

@main
struct PokedexApp: App {
    @State var root: PokedexRoots = .splash
    
    var body: some Scene {
        WindowGroup {
            switch root {
            case .splash:
                LoadingView().onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        root = .home
                    }
                }.transition(AnyTransition.opacity.animation(.easeOut(duration: 1.0)))
            case .home:
                Home(viewModel: HomeViewModel()).transition(AnyTransition.opacity.animation(.easeIn(duration: 1.0)))
            case .list:
                PokedexList(
                    selectedType: .constant(.firstGeneration),
                    viewModel: PokedexListViewModel(selectedType: .all,
                                                    globalData: GlobalData()))
            }
            
        }
    }
}
