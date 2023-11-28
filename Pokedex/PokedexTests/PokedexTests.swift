//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Stefan Czepl on 24.11.22.
//

import XCTest
@testable import Pokedex

final class PokedexTests: XCTestCase {

    func testPokedexInitialization() {
            let pokedex = Pokedex()
            XCTAssertNotNil(pokedex)
        }
        
        func testPokemonInitialization() {
            let pokemon = Pokedex.Pokemon(id: "001", formId: "001", dexNr: 1, generation: 1, names: Pokedex.Name(English: "Bulbasaur", German: "Bisasam", French: "Bulbizarre", Italian: "Bulbasaur", Japanese: "フシギダネ", Korean: "이상해씨", Spanish: "Bulbasaur"), stats: Pokedex.Stats(stamina: 90, attack: 126, defense: 126), primaryType: Pokedex.PokemonType(type: Pokedex.TypeElement.grass, names: Pokedex.Name(English: "Grass", German: "Gras", French: "Plante", Italian: "Erba", Japanese: "くさ", Korean: "풀", Spanish: "Planta")), secondaryType: Pokedex.PokemonType(type: Pokedex.TypeElement.poison, names: Pokedex.Name(English: "Poison", German: "Gift", French: "Poison", Italian: "Veleno", Japanese: "どく", Korean: "독", Spanish: "Veneno")), assets: Pokedex.Assets(image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", shinyImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png"))
            XCTAssertNotNil(pokemon)
            XCTAssertEqual(pokemon.id, "001")
            XCTAssertEqual(pokemon.dexNr, 1)
            XCTAssertEqual(pokemon.generation, 1)
            XCTAssertEqual(pokemon.names.English, "Bulbasaur")
            XCTAssertEqual(pokemon.stats?.stamina, 90)
            XCTAssertEqual(pokemon.primaryType.type, Pokedex.TypeElement.grass)
            XCTAssertEqual(pokemon.secondaryType?.type, Pokedex.TypeElement.poison)
            //XCTAssertEqual(pokemon.assets.image, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
        }
        
        func testTypeElementRawValues() {
        XCTAssertEqual(Pokedex.TypeElement.bug.rawValue, "POKEMON_TYPE_BUG")
        XCTAssertEqual(Pokedex.TypeElement.dark.rawValue, "POKEMON_TYPE_DARK")
        XCTAssertEqual(Pokedex.TypeElement.dragon.rawValue, "POKEMON_TYPE_DRAGON")
        XCTAssertEqual(Pokedex.TypeElement.electric.rawValue, "POKEMON_TYPE_ELECTRIC")
        XCTAssertEqual(Pokedex.TypeElement.fairy.rawValue, "POKEMON_TYPE_FAIRY")
        XCTAssertEqual(Pokedex.TypeElement.fire.rawValue, "POKEMON_TYPE_FIRE")
        XCTAssertEqual(Pokedex.TypeElement.fighting.rawValue, "POKEMON_TYPE_FIGHTING")
        XCTAssertEqual(Pokedex.TypeElement.flying.rawValue, "POKEMON_TYPE_FLYING")
        XCTAssertEqual(Pokedex.TypeElement.ghost.rawValue, "POKEMON_TYPE_GHOST")
        XCTAssertEqual(Pokedex.TypeElement.grass.rawValue, "POKEMON_TYPE_GRASS")
        XCTAssertEqual(Pokedex.TypeElement.ground.rawValue, "POKEMON_TYPE_GROUND")
        XCTAssertEqual(Pokedex.TypeElement.ice.rawValue, "POKEMON_TYPE_ICE")
        XCTAssertEqual(Pokedex.TypeElement.normal.rawValue, "POKEMON_TYPE_NORMAL")
        XCTAssertEqual(Pokedex.TypeElement.poison.rawValue, "POKEMON_TYPE_POISON")
        XCTAssertEqual(Pokedex.TypeElement.psychic.rawValue, "POKEMON_TYPE_PSYCHIC")
        XCTAssertEqual(Pokedex.TypeElement.rock.rawValue, "POKEMON_TYPE_ROCK")
        XCTAssertEqual(Pokedex.TypeElement.steel.rawValue, "POKEMON_TYPE_STEEL")
        XCTAssertEqual(Pokedex.TypeElement.water.rawValue, "POKEMON_TYPE_WATER")
        }
}
