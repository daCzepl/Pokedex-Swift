//
//  NavigationModel.swift
//  Pokedex
//
//  Created by Stefan Czepl on 12.01.23.
//

import Foundation

class NavigationModel: ObservableObject {
    @Published var selectedPokemon : Pokedex.Pokemon?
}
