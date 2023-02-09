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
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [""]
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel,navigationModel: navigationModel)
        }
    }
}
