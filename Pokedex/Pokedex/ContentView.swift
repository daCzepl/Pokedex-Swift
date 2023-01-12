//
//  ContentView.swift
//  Pokedex
//
//  Created by Stefan Czepl on 24.11.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    private let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        Spacer()
        VStack {
            Text("Pokedex")
                .font(.title)
                
            List{
                ForEach(viewModel.pokemons){
                    pokemon in PokemonView(pokemon: pokemon)
                }
            }
            
        }
    }
}
struct PokemonView : View{
    var pokemon: ViewModel.Pokemon
    var body: some View{
        ZStack{
            HStack{
                VStack (alignment: .leading){
                    Text("#\(pokemon.dexNr)")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("\(ViewModel.getDisplayNameByPreferredLanguage(pokemon: pokemon))  ")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    if let secondType = pokemon.secondaryType{
                        Text("\(ViewModel.getTypeNameByPokemon(type: pokemon.primaryType))  \(ViewModel.getTypeNameByPokemon(type: secondType))")
                            .font(.subheadline).bold()
                            .foregroundColor(.black)
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.black.opacity(0.25))
                            )
                    }else{
                        Text("\(ViewModel.getTypeNameByPokemon(type: pokemon.primaryType))")
                            .font(.subheadline).bold()
                            .foregroundColor(.black)
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.black.opacity(0.25))
                            )
                    }
                }
                Spacer()
                if let imageURL = pokemon.assets?.image{
                    AsyncImage(
                        url: URL(string:imageURL),
                        scale: 2.5
                    )
                    
                }
            }.padding()
        }
        .background(ViewModel.getColorByPokemonType(pokeType: pokemon.primaryType.type.rawValue))
        .cornerRadius(12)
    }
        
}

struct PokemonDetailView: View{
    let pokemon: Pokedex.Pokemon
    var body: some View {
        Text("\(ViewModel.getDisplayNameByPreferredLanguage(pokemon: pokemon))")
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}

