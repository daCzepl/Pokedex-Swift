//
//  ViewModel.swift
//  Pokedex
//
//  Created by Stefan Czepl on 22.12.22.
//

import Foundation
import SwiftUI

class ViewModel:ObservableObject{
    @Published private var model = Pokedex()
    typealias Pokemon = Pokedex.Pokemon

    
    
    init(){
        let downloadQueue = DispatchQueue(label: "download")
        downloadQueue.async {
            if let data = ViewModel.load() {
                DispatchQueue.main.async {
                    self.model.fromJson(data: data)
                }
            }
        }
    }
    
    var pokemons :[Pokedex.Pokemon]{
        model.pokemons;
    }
    static func load() -> Data? {
        var data: Data?
        if let url = URL(string: Pokedex.BASE) {
            data = try? Data(contentsOf:url)
        }
        return data
    }

    static func getColorByPokemonType(pokeType : String) -> Color{
            switch(pokeType.uppercased()){
            case "POKEMON_TYPE_BUG" :
                return ViewModel.getColorWithRgb(red: 166, green: 185, blue: 26)
            case "POKEMON_TYPE_DARK" :
                return ViewModel.getColorWithRgb(red: 112, green: 87, blue: 70)
            case "POKEMON_TYPE_DRAGON" :
                return ViewModel.getColorWithRgb(red: 111, green: 53, blue: 252)
            case "POKEMON_TYPE_ELECTRIC" :
                return ViewModel.getColorWithRgb(red: 247, green: 208, blue: 44)
            case "POKEMON_TYPE_FAIRY" :
                return ViewModel.getColorWithRgb(red: 214, green: 133, blue: 173)
            case "POKEMON_TYPE_FIRE" :
                return ViewModel.getColorWithRgb(red: 238, green: 129, blue: 48)
            case "POKEMON_TYPE_FIGHTING" :
                return ViewModel.getColorWithRgb(red: 194, green: 46, blue: 40)
            case "POKEMON_TYPE_FLYING" :
                return ViewModel.getColorWithRgb(red: 169, green: 143, blue: 243)
            case "POKEMON_TYPE_GHOST" :
                return ViewModel.getColorWithRgb(red: 115, green: 87, blue: 151)
            case "POKEMON_TYPE_GRASS" :
                return ViewModel.getColorWithRgb(red: 122, green: 199, blue: 76)
            case "POKEMON_TYPE_GROUND" :
                return ViewModel.getColorWithRgb(red: 226, green: 191, blue: 101)
            case "POKEMON_TYPE_ICE" :
                return ViewModel.getColorWithRgb(red: 150, green: 217, blue: 214)
            case "POKEMON_TYPE_NORMAL" :
                return ViewModel.getColorWithRgb(red: 168, green: 167, blue: 122)
            case "POKEMON_TYPE_POISON" :
                return ViewModel.getColorWithRgb(red: 163, green: 62, blue: 161)
            case "POKEMON_TYPE_PSYCHIC" :
                return ViewModel.getColorWithRgb(red: 249, green: 85, blue: 135)
            case "POKEMON_TYPE_ROCK" :
                return ViewModel.getColorWithRgb(red: 182, green: 161, blue: 54)
            case "POKEMON_TYPE_STEEL" :
                return ViewModel.getColorWithRgb(red: 183, green: 183, blue: 206)
            case "POKEMON_TYPE_WATER" :
                return ViewModel.getColorWithRgb(red: 99, green: 144, blue: 240)
            default:
                return Color.white
            }
        }
        static func getColorWithRgb(red: Double,green: Double,blue :Double) -> Color{
            return Color(red:(red/255),green: (green/255),blue: (blue/255))
        }
    
    
    static func getDisplayNameByPreferredLanguage(pokemon: Pokemon) -> String {
        let languageCode = Locale.preferredLanguages[0]
        switch languageCode.prefix(2) {
        case "de":
            return pokemon.names.German
        case "fr":
            return pokemon.names.French
        case "it":
            return pokemon.names.Italian
        case "ja":
            return pokemon.names.Japanese
        case "ko":
            return pokemon.names.Korean
        case "es":
            return pokemon.names.Spanish
        default:
            return pokemon.names.English
        }
    }
    
    static func getTypeNameByPokemon(type: Pokedex.PokemonType) -> String {
        let languageCode = Locale.preferredLanguages[0]
        switch languageCode.prefix(2) {
        case "de":
            return type.names.German
        case "fr":
            return type.names.French
        case "it":
            return type.names.Italian
        case "ja":
            return type.names.Japanese
        case "ko":
            return type.names.Korean
        case "es":
            return type.names.Spanish
        default:
            return type.names.English
        }
    }
}
