//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Stefan Czepl on 24.11.22.
//

import SwiftUI

@main
struct PokedexApp: App {
    let viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
