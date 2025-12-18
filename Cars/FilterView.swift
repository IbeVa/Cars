//
//  FilterView.swift
//  Cars
//
//  Created by Ibe Vangheluwe on 18/12/2025.
//

import SwiftUI

struct FilterView: View {
    var filter = ["Alle", "Benzine", "Elektrisch"]
    @State var selectedFilter = "Alle"
    @Environment(PathStore.self) var pathStore
    var body: some View {
        @Bindable var path = pathStore

        VStack{
            NavigationStack(path: $path.path){
                Picker("Brandstof", selection: $selectedFilter) {
                    ForEach(filter, id: \.self){ filter in
                        Text(filter)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                HomeView(selectedFilter: $selectedFilter)
            }
        }
        
    }
}

#Preview {
    FilterView()
}
