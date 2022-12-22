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
    static func load() -> Data? {
        var data: Data?
        if let url = URL(string: Pokedex.BASE) {
            data = try? Data(contentsOf:url)
        }
        return data
    }
}
