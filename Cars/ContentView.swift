//
//  ContentView.swift
//  Cars
//
//  Created by Ibe Vangheluwe on 16/12/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house"){
                FilterView()
            }
            
            Tab("Favorieten", systemImage: "star.fill"){
                FavoritesView()
            }
            
            Tab("Instellingen", systemImage: "cog"){
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
