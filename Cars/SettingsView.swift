//
//  SettingsView.swift
//  Cars
//
//  Created by Ibe Vangheluwe on 18/12/2025.
//

import SwiftUI

struct SettingsView: View {
    var sortering = ["Prijs", "Merk", "Jaar"]
    @State var selectedSorting: String = "Prijs"
    @Environment(DataManager.self) var dataStore
    var body: some View {
        Picker("Sortering", selection: $selectedSorting) {
            ForEach(sortering, id: \.self){ sort in
                Text(sort)
            }
        }.onChange(of: selectedSorting) {
            dataStore.selectedFuelType = selectedSorting
            dataStore.sort()
        }
    }
}
