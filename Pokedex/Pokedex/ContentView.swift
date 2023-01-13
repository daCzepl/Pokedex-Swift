//
//  ContentView.swift
//  Pokedex
//
//  Created by Stefan Czepl on 24.11.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var navigationModel: NavigationModel
    var body: some View {
            NavigationStack {
                List(viewModel.pokemons) {
                    pokemon in NavigationLink(value: pokemon,label: {
                        PokemonView(pokemon: pokemon)
                    })
                }
                .padding(.bottom)
                .navigationDestination(for: ViewModel.Pokemon.self, destination: {pokemon in PokemonDetailView(pokemon: pokemon)})
                .navigationTitle("Pokemon")
                .task {
                    viewModel.downloadAllPokemon()
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
    let pokemon: ViewModel.Pokemon
    var body: some View {
        VStack{
            if let imageUrl = pokemon.assets?.image{
                AsyncImage(url: URL(string: imageUrl))
                    .padding(.bottom)
            }
            VStack{
                Text("**Attack**: \(pokemon.stats?.attack ?? 0)")
                Text("**Defense**: \(pokemon.stats?.defense ?? 0)")
                Text("**Stamina**: \(pokemon.stats?.stamina ?? 0)")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static let navigationModel = NavigationModel()
    static var previews: some View {
        ContentView(viewModel: viewModel,navigationModel: navigationModel)
    }
}

