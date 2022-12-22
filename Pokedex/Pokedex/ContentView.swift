//
//  ContentView.swift
//  Pokedex
//
//  Created by Stefan Czepl on 24.11.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        List{
            ForEach(viewModel.pokemons){
                pokemon in PokemonView(pokemon: pokemon)
            }
        }
    }
}
struct PokemonView : View{
    var pokemon: ViewModel.Pokemon
    var body: some View{
        Text("\(pokemon.dexNr)")
    }
}
struct ContentView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
