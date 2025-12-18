//
//  CarDetailView.swift
//  Cars
//
//  Created by Ibe Vangheluwe on 16/12/2025.
//

import SwiftUI

struct CarDetailView: View {
    var car : Car
    @Environment(DataManager.self) var dataStore
    @State var navigateToFilter: Bool = false
    var body: some View {
        VStack{
            if navigateToFilter{
                FilterView()
            }
            Text(car.brand).font(.largeTitle)
            Divider()
            VStack{
                Text("Fuel Type: " + car.fuelType)
                Text("Price: " + String(car.price))
                Text("Model: " + car.model)
                Text("Year: " + String(car.year))
            }.frame(maxWidth: .infinity, alignment: .leading).padding(20)
            Divider()
            
            VStack{
                if dataStore.isFav(car: car){
                    Button {
                        dataStore.removeCarFromFav(newCar: car)
                    } label: {
                        Text("Remove from Favorites").foregroundStyle(Color.white).frame(maxWidth: .infinity, maxHeight: 50 ,alignment: .center)
                    }.buttonStyle(.borderless).background(Color.red).cornerRadius(10).padding(20)
                }else{
                    Button {
                        dataStore.addFav(car: car)
                    } label: {
                        Text("Add to Favorites").foregroundStyle(Color.white).frame(maxWidth: .infinity, maxHeight: 50 ,alignment: .center)
                    }.buttonStyle(.borderless).background(Color.green).cornerRadius(10).padding(20)
                }
                
                Button(){
                    navigateToFilter = true
                } label: {
                    Text("Go to filter").foregroundStyle(Color.white).frame(maxWidth: .infinity, maxHeight: 50 ,alignment: .center)
                }.buttonStyle(.borderless).background(Color.blue).cornerRadius(10).padding(20)
            }.frame(maxWidth: .infinity)
        }
    }
}

