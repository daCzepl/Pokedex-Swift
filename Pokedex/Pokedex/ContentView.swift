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
    
    @State private var searchText = ""
    
    var body: some View {
            NavigationStack {
                List(filteredPokemon) {
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
                .searchable(text: $searchText)
            }
            
    }
    var filteredPokemon : [Pokedex.Pokemon] {
        if searchText.isEmpty {
            return viewModel.pokemons
        }else {
            return viewModel.pokemons.filter { ViewModel.getDisplayNameByPreferredLanguage(pokemon: $0).contains(searchText)}
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

struct PokemonDetailView: View {
    let pokemon: ViewModel.Pokemon
    @State private var shiny = false;
    var body: some View {
        ZStack {
            
            VStack(alignment: .center) {
                if let shinyUrl = pokemon.assets?.shinyImage{
                    Toggle("Shiny",isOn: $shiny)
                    if(shiny == true){
                        AsyncImage(url: URL(string: shinyUrl))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(ViewModel.getColorByPokemonType(pokeType: pokemon.primaryType.type.rawValue), lineWidth: 4))
                            .shadow(radius: 10)
                            .padding(.top, 50)
                    }else if let imageUrl = pokemon.assets?.image {
                        AsyncImage(url: URL(string: imageUrl))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(ViewModel.getColorByPokemonType(pokeType: pokemon.primaryType.type.rawValue), lineWidth: 4))
                            .shadow(radius: 10)
                            .padding(.top, 50)
                    }
                }else if let imageUrl = pokemon.assets?.image {
                    AsyncImage(url: URL(string: imageUrl))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(ViewModel.getColorByPokemonType(pokeType: pokemon.primaryType.type.rawValue), lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.top, 50)
                }
                Text(ViewModel.getDisplayNameByPreferredLanguage(pokemon: pokemon))
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                HStack {
                    VStack {
                        Text("Attack")
                            .font(.headline)
                    Text("\(pokemon.stats?.attack ?? 0)")
                        StatProgressView(value: Double((pokemon.stats?.attack ?? 0)), maxValue: 345.0, color: ViewModel.getColorByPokemonType(pokeType: pokemon.primaryType.type.rawValue))
                        
                    }
                    Spacer()
                    VStack {
                        Text("Defense")
                            .font(.headline)
                        Text("\(pokemon.stats?.defense ?? 0)")
                            StatProgressView(value: Double((pokemon.stats?.defense ?? 0)), maxValue: 345.0, color: ViewModel.getColorByPokemonType(pokeType: pokemon.primaryType.type.rawValue))}
                    Spacer()
                    VStack {
                        Text("Stamina")
                            .font(.headline)
                        Text("\(pokemon.stats?.stamina ?? 0)")
                            StatProgressView(value: Double((pokemon.stats?.stamina ?? 0)), maxValue: 345.0, color: ViewModel.getColorByPokemonType(pokeType: pokemon.primaryType.type.rawValue))                   }
                }
                .padding(.top, 20)
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

struct StatProgressView: View {
    let value: Double
    let maxValue: Double
    let color: Color
    var body: some View {
        ProgressView(value: value / maxValue)
            .frame(width: 100)
            .background(Color.gray)
            .accentColor(color)
            .padding(.all, 10)
    }
}
