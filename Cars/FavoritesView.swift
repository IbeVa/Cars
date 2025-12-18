//
//  FavoritesView.swift
//  Cars
//
//  Created by Ibe Vangheluwe on 18/12/2025.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(DataManager.self) var dataStore
    var body: some View {
        VStack{
            List(dataStore.getFav()){ car in
                VStack{
                    Text(car.brand).font(.largeTitle)
                    Text(car.model)
                    Text(String(car.price) + " euro").foregroundStyle(.gray)
                    Button("Remove from favorites"){
                        dataStore.removeCarFromFav(newCar: car)
                    }
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
}
