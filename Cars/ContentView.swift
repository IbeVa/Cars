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
                HomeView()
            }
            
            Tab("Favorieten", systemImage: "star.fill"){
                
            }
            
            Tab("Instellingen", systemImage: "cog"){
                
            }
        }
    }
}

#Preview {
    ContentView()
}
