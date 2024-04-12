//
//  PokemonData.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 1/4/24.
//

import Foundation

// MARK: - PokemonData
public struct PokemonData: Decodable {
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Form]
    let identifier: Int?
    let height: Int
    let locationAreaEncounters: String
    let moves: [Move] 
    let name: String?
    let order: Int
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case identifier = "id"
        case forms, height
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order, sprites, stats, types, weight
    }
}

extension PokemonData {
    public func toDO() -> PokemonDataRepresentable {
        return PokemonDataRepresentable(dto: self)
    }
}

// MARK: - Ability
struct Ability: Decodable {
    let ability: Form
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

extension Ability {
    public func toDO() -> AbilityRepresentable {
        return AbilityRepresentable(dto: self)
    }
}

// MARK: - Form
struct Form: Decodable {
    let name: String
    let url: String
}

extension Form {
    public func toDO() -> FormRepresentable {
        return FormRepresentable(dto: self)
    }
}

// MARK: - Move
struct Move: Decodable {
    let move: Form
}

extension Move {
    public func toDO() -> MoveRepresentable {
        return MoveRepresentable(dto: self)
    }
}

// MARK: - Sprites
struct Sprites: Decodable {
    let frontDefault: String
    let frontShiny: String?
    let other: Other

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case other
    }
}

extension Sprites {
    public func toDO() -> SpritesRepresentable {
        return SpritesRepresentable(dto: self)
    }
}

// MARK: - Other
struct Other: Decodable {
    let home, officialArtwork: PokemonHome

    enum CodingKeys: String, CodingKey {
        case home
        case officialArtwork = "official-artwork"
    }
}

extension Other {
    public func toDO() -> OtherRepresentable {
        return OtherRepresentable(dto: self)
    }
}

// MARK: - PokemonHome
struct PokemonHome: Decodable {
    let frontDefault: String
    let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

extension PokemonHome {
    public func toDO() -> PokemonHomeRepresentable {
        return PokemonHomeRepresentable(dto: self)
    }
}

// MARK: - Stat
struct Stat: Decodable {
    let baseStat, effort: Int
    let stat: Form

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

extension Stat {
    public func toDO() -> StatRepresentable {
        return StatRepresentable(dto: self)
    }
}

// MARK: - TypeElement
struct TypeElement: Decodable {
    let slot: Int
    let type: Form
}

extension TypeElement {
    public func toDO() -> TypeElementRepresentable {
        return TypeElementRepresentable(dto: self)
    }
}
