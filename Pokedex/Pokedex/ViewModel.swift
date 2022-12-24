//
//  ViewModel.swift
//  Pokedex
//
//  Created by Stefan Czepl on 22.12.22.
//

import Foundation

class ViewModel:ObservableObject{
    @Published private var model = Pokedex()
    typealias Pokemon = Pokedex.Pokemon

    
    
    init(){
        let downloadQueue = DispatchQueue(label: "download")
        downloadQueue.async {
            if let data = ViewModel.load() {
                DispatchQueue.main.async {
                    self.model.fromJson(data: data)
                }
            }
        }
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
    func bangoGiveColorPlease(){
        
    }
}
