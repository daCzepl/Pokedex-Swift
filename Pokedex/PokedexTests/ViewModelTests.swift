//
//  ViewModelTests.swift
//  PokedexTests
//
//  Created by Jakob Hoffmann on 19.01.23.
//

import XCTest
@testable import Pokedex
import SwiftUI

class ViewModelTests: XCTestCase {
    func testViewModel() {
        let viewModel = ViewModel()

        // Test downloadAllPokemon method
        viewModel.downloadAllPokemon()
        XCTAssertNotNil(viewModel.pokemons)

        // Test getColorByPokemonType method
        let color = ViewModel.getColorByPokemonType(pokeType: "POKEMON_TYPE_BUG")
        XCTAssertEqual(color, ViewModel.getColorWithRgb(red: 166, green: 185, blue: 26))

        // Test getColorWithRgb method
        let color2 = ViewModel.getColorWithRgb(red: 100, green: 100, blue: 100)
        XCTAssertEqual(color2, Color(red: 0.39215686274509803, green: 0.39215686274509803, blue: 0.39215686274509803))
    }
}
