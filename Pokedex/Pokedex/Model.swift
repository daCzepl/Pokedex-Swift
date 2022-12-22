import Foundation

struct Pokedex {
    
    private (set) var pokemons = [Pokemon]()
    static let BASE = "https://pokemon-go-api.github.io/pokemon-go-api/api/pokedex.json"
    
    mutating func fromJson(data: Data) {
        if let jsonPokemon = try? JSONDecoder().decode([Pokemon].self, from: data) {
            pokemons = jsonPokemon
        }
        print(pokemons[1].dexNr)
    }

    struct Pokemon: Identifiable,Codable{
        
        
        let id: String
        let formId: String
        let dexNr: Int
        let generation: Int
        let names: Name
        let stats: Stats
        let primaryType: PokemonType
        let secondaryType: PokemonType
        let assets: Assets
    }
    
    
    struct Name: Codable {
        let English, German, French, Italian, Japanese, Korean, Spanish: String
    }
    
    struct Stats: Codable{
        let stamina, attack, defense: Int
    }
    struct PokemonType: Codable {
        let type: TypeElement	
        let names: Name
    }
    
    struct Assets: Codable {
        let image, shinyImage: String
    }
    
    
    enum TypeElement: String, Codable{
        case bug = "POKEMON_TYPE_BUG"
        case dark = "POKEMON_TYPE_DARK"
        case dragon = "POKEMON_TYPE_DRAGON"
        case electric = "POKEMON_TYPE_ELECTRIC"
        case fairy = "POKEMON_TYPE_FAIRY"
        case fire = "POKEMON_TYPE_FIRE"
        case fighting = "POKEMON_TYPE_FIGHTING"
        case flying = "POKEMON_TYPE_FLYING"
        case ghost = "POKEMON_TYPE_GHOST"
        case grass = "POKEMON_TYPE_GRASS"
        case ground = "POKEMON_TYPE_GROUND"
        case ice = "POKEMON_TYPE_ICE"
        case normal = "POKEMON_TYPE_NORMAL"
        case poison = "POKEMON_TYPE_POISON"
        case psychic = "POKEMON_TYPE_PSYCHIC"
        case rock = "POKEMON_TYPE_ROCK"
        case steel = "POKEMON_TYPE_STEEL"
        case water = "POKEMON_TYPE_WATER"
    }
}
