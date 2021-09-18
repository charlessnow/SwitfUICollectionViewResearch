//
//  PokemonModel.swift
//  CollectionViewSwiftUI
//
//  Created by applewatchnew on 2021/9/18.
//  Copyright © 2021 Adam Niepokój. All rights reserved.
//

import Foundation
import UIKit

struct PokemonImage: Identifiable {
    var id: Int {
        pokemon.id
    }
    var pokemon: Pokemon
    var image: UIImage
}

struct Pokemon: Codable {
    var id :Int
    let name: String
    let abilities: [AbilityElement]
    let sprites: SpritesElement
    var pokeName:String {
        return name
    }
    var typeString:String {
        return "Type"
    }
    struct AbilityElement: Codable {
        let ability: Ability
        let isHidden: Bool
        let slot: Int

        struct Ability: Codable {
            let name: String
            let url: String
        }
        
        enum CodingKeys: String, CodingKey {
            case isHidden = "is_hidden"
            case ability
            case slot
        }
    }
    
    struct SpritesElement: Codable {
        let frontDefault:String
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
    
        }
    }
}

struct PokemonAPIList : Decodable {
    var results: [PokemonListEntry]
}

struct PokemonListEntry: Decodable {
    var name: String
    var url: String
}
