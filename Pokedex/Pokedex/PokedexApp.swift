//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Stefan Czepl on 24.11.22.
//

import SwiftUI
import GoogleMobileAds

@main
struct PokedexApp: App {
    let viewModel = ViewModel()
    let navigationModel = NavigationModel()
    init(){
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["b82bd73522b867ebd41b996359f46fc4"]
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel,navigationModel: navigationModel)
        }
    }
}
