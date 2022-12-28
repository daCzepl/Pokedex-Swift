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
                    Text("\(ViewModel.getDisplayNameByPreferredLanguage(pokemon: pokemon))  ")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.top)
                    
                    if let secondType = pokemon.secondaryType?.names.English{
                        Text("\(pokemon.primaryType.names.English)  \(secondType)")
                            .font(.subheadline).bold()
                            .foregroundColor(.black)
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.black.opacity(0.25))
                            )
                    }else{
                        Text("\(pokemon.primaryType.names.English)")
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
struct ContentView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}

