//
//  ViewModel.swift
//  Pokedex
//
//  Created by Stefan Czepl on 22.12.22.
//

import Foundation

class ViewModel:ObservableObject{
    @Published private var model = Pokedex()
    
    init(){
        
    }
    
    var pokemons :[Pokedex.Pokemon]{
        model.pokemons;
    }
}
