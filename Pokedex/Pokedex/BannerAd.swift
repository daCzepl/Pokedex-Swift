//
//  BannerAd.swift
//  Pokedex
//
//  Created by Cedric Bauer on 02.02.23.
//

import SwiftUI
import GoogleMobileAds

struct BannerAd: UIViewRepresentable{
    
    var unitID: String
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> GADBannerView {
        let adView = GADBannerView(adSize: GADAdSizeBanner)
        adView.adUnitID = unitID
        adView.rootViewController = UIApplication.shared.getRootViewController()
        
        adView.load(GADRequest())
        
        return adView
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {
        
    }
    
    class Coordinator: NSObject, GADBannerViewDelegate{
        func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
            print("bannerViewDidReceiveAd")
        }
    }
    
}

extension UIApplication{
    func getRootViewController()->UIViewController{
        guard let screen = self.connectedScenes as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        return root
    }
}
