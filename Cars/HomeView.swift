//
//  HomeView.swift
//  Cars
//
//  Created by Ibe Vangheluwe on 16/12/2025.
//

import SwiftUI

struct HomeView: View {
    @State var loading: Bool = true
    @Environment(DataManager.self) var dataManager
    @Environment(PathStore.self) var pathStore
    @State var selectedCar: Car?
    var body: some View {
        @Bindable var path = pathStore
        VStack {
            if loading {
                ProgressView("loading...")
            }else{
                NavigationStack(path: $path.path) {
                    List(dataManager.cars, id: \.self, selection: $selectedCar) { car in
                        NavigationLink(value: Route.car(car)){
                            VStack(alignment: .leading) {
                                Text(car.brand).font(.largeTitle)
                                Text(car.model)
                                Text(String(car.price) + " euro").foregroundStyle(.gray)
                            }
                        }
                    }.navigationDestination(for: Route.self) { route in
                        switch route {
                        case let .car(car):
                            CarDetailView(car: car)
                        }
                    }
                }
            }
        }.task {
            await dataManager.loadCars()
            loading = false
        }
    }
}


