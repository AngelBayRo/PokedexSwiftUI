//
//  Home.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 21/3/24.
//

import SwiftUI

struct Home: View {
    @State private var selectedType: PokedexType = .all
    @State private var showOptions: Bool = false
    @ObservedObject var viewModel: HomeViewModel
    
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        VStack {
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    //OptionsView
    @ViewBuilder
    func content() -> some View {
        NavigationView(content: {
            GeometryReader(content: { geometry in
                let size = geometry.size
                VStack(spacing: 0) {
                    Text("Pokedex")
                        .font(.custom("Pokemon Hollow", size: 36))
                    HStack(spacing: 0) {
                        Text(selectedType.rawValue)
                            .foregroundStyle(.primary)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .rotationEffect(.init(degrees: showOptions ? -180 : 0))
                        
                    }
                    .padding(.horizontal, 15)
                    .frame(width: size.width, height: size.height)
                    .containerShape(.rect)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            showOptions.toggle()
                        }
                    }
                    .background((scheme == .dark ? Color.black : .white)
                        .shadow(.drop(color: .primary.opacity(0.15), radius: 4)), in: .rect(cornerRadius: 10))
                    
                    
                    if showOptions {
                        optionsView(viewModel.data)
                    }
                    
                    NavigationLink(destination: PokedexList(selectedType: .constant(selectedType), viewModel: PokedexListViewModel(selectedType: selectedType))) {
                        Text("Aceptar")
                    }
                    .padding(20)
                }
                .padding(.top, -100)
            })
            .frame(width: 180, height: 50)
        })
    }
    
    //OptionsView
    @ViewBuilder
    func optionsView(_ types: [PokedexType]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
        Spacer()
            VStack(spacing: 4) {
                ForEach(types, id: \.self) { type in
                    PokedexTypeSelectorView(text: type.rawValue).foregroundStyle(.primary)
                     .animation(.none, value: selectedType)
                     .frame(height: 40)
                     .contentShape(.rect)
                     .onTapGesture {
                        withAnimation(.snappy) {
                            selectedType = type
                            showOptions = false
                        }
                     }.background((scheme == .dark ? Color.black : .white)
                        .shadow(.drop(color: .primary.opacity(0.15), radius: 4)), in: .rect(cornerRadius: 10))
                    Spacer()
                }
            }
        }
        .frame(height: 300)
        .padding(.horizontal, 15)
    }
}

#Preview {
    Home(viewModel: HomeViewModel())
}
