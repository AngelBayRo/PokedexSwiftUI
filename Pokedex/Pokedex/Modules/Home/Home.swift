//
//  Home.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 21/3/24.
//

import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) private var scheme
    @Environment(\.pokedexStrings) private var strings
    
    @State private var selectedType: PokedexRegionName = .all
    @State private var showOptions: Bool = false
    
    @StateObject private var globalViewModel = GlobalData()
    
    var viewModel: HomeViewModel
    var constants = HomeConstants()
    
    var body: some View {
        VStack {
            HStack(spacing: constants.basicPadding) {
                Spacer()
                Text(strings.toggleAsyncTitle)
                Toggle("", isOn: $globalViewModel.asyncAwaitEnabled)
                    .labelsHidden()
            }
            .padding(.horizontal,
                     constants.bodyPaddingHorizontal)
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer()
        }
    }
    
    //OptionsView
    @ViewBuilder
    func content() -> some View {
        ZStack {
            NavigationView(content: {
                GeometryReader(content: { geometry in
                    let size = geometry.size
                    VStack(spacing: constants.zeroValue) {
                        content(size)
                    }
                    .padding(.top, constants.paddingTop)
                })
                .frame(width: constants.frameWidth,
                       height: constants.frameHeight)
            })
        }
    }
    
    @ViewBuilder
    func content(_ size: CGSize) -> some View {
        Text(strings.appTitle)
            .font(.custom(strings.fontName,
                          size: constants.fontSizeTitle))
        HStack(spacing: constants.zeroValue) {
            Text(selectedType.rawValue)
                .foregroundStyle(.primary)
            Spacer()
            Image(systemName: "chevron.down")
                .font(.title3)
                .foregroundColor(.primary)
                .rotationEffect(.init(degrees: showOptions ? constants.rotationValue : constants.zeroValue))
            
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
            .shadow(.drop(color: .primary.opacity(0.15),
                          radius: 4)),
                    in: .rect(cornerRadius: 10))
        
        
        if showOptions {
            optionsView(viewModel.data)
        }
        
        NavigationLink(destination: listView()) {
            Text(strings.acceptButtonText)
        }
        .padding(20)
    }
    
    func listView() -> some View {
        let model = PokedexListViewModel(selectedType: selectedType, globalData: globalViewModel)
        
        let view = PokedexList(selectedType: .constant(selectedType),
                               viewModel: model)
            .environmentObject(globalViewModel)
        
        return view
    }
    
    //OptionsView
    @ViewBuilder
    func optionsView(_ types: [PokedexRegionName]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
        Spacer()
            VStack(spacing: constants.optionSpacing) {
                ForEach(types, id: \.self) { type in
                    PokedexRegionSelectorView(text: type.rawValue).foregroundStyle(.primary)
                     .animation(.none, value: selectedType)
                     .frame(height: constants.optionHeight)
                     .contentShape(.rect)
                     .onTapGesture {
                        withAnimation(.snappy) {
                            selectedType = type
                            showOptions = false
                        }
                     }.background((scheme == .dark ? Color.black : .white)
                        .shadow(.drop(color: .primary.opacity(0.15),
                                      radius: 4)),
                                  in: .rect(cornerRadius: 10))
                    Spacer()
                }
            }
        }
        .frame(height: constants.optionsSizeHeight)
        .padding(.horizontal, constants.optionPaddingHorizontal)
    }
}

#Preview {
    Home(viewModel: HomeViewModel())
}
