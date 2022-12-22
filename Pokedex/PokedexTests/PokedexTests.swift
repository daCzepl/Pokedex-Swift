//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Stefan Czepl on 24.11.22.
//

import XCTest
@testable import Pokedex

final class PokedexTests: XCTestCase {

    func testThatPokedexIsCreated() throws {
        let pokedex = Pokedex()
        
        XCTAssertNotNil(pokedex)
        XCTAssertNotNil(pokedex.pokemons)
        
    }
}
