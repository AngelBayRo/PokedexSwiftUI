//
//  PokemonDataRepresentable.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 1/4/24.
//

import Foundation

public struct PokemonDataRepresentable: Identifiable {
    public var id: String  { "\(identifier)-\(name)" }
    
    public let name: String
    public let identifier: Int
    public let abilities: [AbilityRepresentable]
    public let baseExperience: Int
    public let forms: [FormRepresentable]
    public let height: Int
    public let locationAreaEncounters: String
    public let moves: [MoveRepresentable]
    public let order: Int
    public var sprites: SpritesRepresentable
    public let stats: [StatRepresentable]
    public let types: [TypeElementRepresentable]
    public let weight: Int
}

extension PokemonDataRepresentable {
    init(dto item: PokemonData) {
        self.init(name: item.name ?? "",
                  identifier: item.identifier ?? 0,
                  abilities: item.abilities.map { $0.toDO() },
                  baseExperience: item.baseExperience,
                  forms: item.forms.map { $0.toDO() },
                  height: item.height,
                  locationAreaEncounters: item.locationAreaEncounters,
                  moves: item.moves.map { $0.toDO() },
                  order: item.order,
                  sprites: item.sprites.toDO(),
                  stats: item.stats.map { $0.toDO() },
                  types: item.types.map { $0.toDO() },
                  weight: item.weight)
    }
    
    //Init as mock
    init() {
        self.init(name: "gyarados",
                  identifier: 0,
                  abilities: [AbilityRepresentable(ability: FormRepresentable(name: "formName", url: "https://pokeapi.co/api/v2/ability/22/"), isHidden: false, slot: 1),
                              AbilityRepresentable(ability: FormRepresentable(name: "formName2", url: "https://pokeapi.co/api/v2/ability/22/"), isHidden: true, slot: 2)],
                  baseExperience: 189,
                  forms: [FormRepresentable(name: "Gyarados", url: "https://pokeapi.co/api/v2/pokemon-form/902/")],
                  height: 65,
                  locationAreaEncounters: "https://pokeapi.co/api/v2/pokemon/902/encounters",
                  moves: [MoveRepresentable(move: FormRepresentable(name: "headbutt", url: "https://pokeapi.co/api/v2/move/29/"))],
                  order: 211,
                  sprites: SpritesRepresentable(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/902.png",
                                                frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/902.png",
                                                other: OtherRepresentable(home: PokemonHomeRepresentable(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/902.png",
                                                                                                         frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/902.png"),
                                                                          officialArtwork: PokemonHomeRepresentable(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/902.png",
                                                                                                                    frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/902.png"))),
                  stats: [StatRepresentable(baseStat: 95, effort: 0, stat: FormRepresentable(name: "hp", url: "https://pokeapi.co/api/v2/stat/1/")),
                          StatRepresentable(baseStat: 125, effort: 2, stat: FormRepresentable(name: "attack", url: "https://pokeapi.co/api/v2/stat/2/")),
                          StatRepresentable(baseStat: 79, effort: 0, stat: FormRepresentable(name: "defense", url: "https://pokeapi.co/api/v2/stat/3/")),
                          StatRepresentable(baseStat: 60, effort: 0, stat: FormRepresentable(name: "special-attack", url: "https://pokeapi.co/api/v2/stat/4/")),
                          StatRepresentable(baseStat: 100, effort: 0, stat: FormRepresentable(name: "special-defense", url: "https://pokeapi.co/api/v2/stat/5/")),
                          StatRepresentable(baseStat: 81, effort: 0, stat: FormRepresentable(name: "speed", url: "https://pokeapi.co/api/v2/stat/6/"))],
                  types: [TypeElementRepresentable(slot: 1, type: FormRepresentable(name: "water", url: "https://pokeapi.co/api/v2/type/11/")),
                          TypeElementRepresentable(slot: 2, type: FormRepresentable(name: "flying", url: "https://pokeapi.co/api/v2/type/3/"))],
                  weight: 2350)
    }
}

// MARK: - Ability
public struct AbilityRepresentable: Identifiable {
    public var id: String  { "\(ability.name)-\(slot)" }
    public let ability: FormRepresentable
    public let isHidden: Bool
    public let slot: Int
}

extension AbilityRepresentable {
    init(dto item: Ability) {
        self.init(ability: item.ability.toDO(),
                  isHidden: item.isHidden,
                  slot: item.slot)
    }
}

// MARK: - Form
public struct FormRepresentable {
    public let name: String
    public let url: String
}

extension FormRepresentable {
    init(dto item: Form) {
        self.init(name: item.name,
                  url: item.url)
    }
}

// MARK: - Move
public struct MoveRepresentable {
    public let move: FormRepresentable
}

extension MoveRepresentable {
    init(dto item: Move) {
        self.init(move: item.move.toDO())
    }
}

// MARK: - Sprites
public struct SpritesRepresentable {
    let frontDefault: String
    var frontShiny: String?
    var other: OtherRepresentable
}

extension SpritesRepresentable {
    init(dto item: Sprites) {
        self.init(frontDefault: item.frontDefault,
                  frontShiny: item.frontShiny,
                  other: item.other.toDO())
    }
}

// MARK: - Other
public struct OtherRepresentable {
    public let home: PokemonHomeRepresentable
    public var officialArtwork: PokemonHomeRepresentable
}

extension OtherRepresentable {
    init(dto item: Other) {
        self.init(home: item.home.toDO(),
                  officialArtwork: item.officialArtwork.toDO())
    }
}

// MARK: - PokemonHome
public struct PokemonHomeRepresentable {
    public let frontDefault: String
    public var frontShiny: String?
}

extension PokemonHomeRepresentable {
    init(dto item: PokemonHome) {
        self.init(frontDefault: item.frontDefault,
                  frontShiny: item.frontShiny)
    }
}

// MARK: - Stat
public struct StatRepresentable: Identifiable {
    public var id: String  { "\(stat.name)-\(baseStat)" }
    public let baseStat: Int
    public let effort: Int
    public let stat: FormRepresentable
}

extension StatRepresentable {
    init(dto item: Stat) {
        self.init(baseStat: item.baseStat,
                  effort: item.effort,
                  stat: item.stat.toDO())
    }
}

// MARK: - PokemonHome
public struct TypeElementRepresentable {
    public let slot: Int
    public let type: FormRepresentable
}

extension TypeElementRepresentable {
    init(dto item: TypeElement) {
        self.init(slot: item.slot,
                  type: item.type.toDO())
    }
}
