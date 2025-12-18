import Foundation
@Observable
class DataManager {
    var cars: [Car] = []
    var favorites: [Car] = []
    var selectedFuelType: String = "Prijs"
    
    func getCars(brandstof: String) -> [Car] {
        var newCars: [Car] = []
        if brandstof == "Alle" {
            return cars
        }else{
            for c in cars{
                if c.fuelType == brandstof {
                    newCars.append(c)
                }
            }
        }
        return newCars
    }
    
    func sort() {
        if selectedFuelType == "Jaar"{
            cars.sort { car1, car2 in
                return car1.year < car2.year
            }
        }else if selectedFuelType == "Prijs"{
            cars.sort { car1, car2 in
                return car1.price < car2.price
            }
        }else{
            cars.sort { car1, car2 in
                return car1.brand < car2.brand
            }
        }
        
    }
    
    func addFav(car:Car) {
        favorites.append(car)
    }
    
    func getFav() -> [Car]{
        return favorites
    }
    
    func isFav(car:Car) -> Bool {
        for fav in favorites {
            if fav.id == car.id {
                return true
            }
        }
        
        return false
    }
    
    func removeCar(newCar:Car) {
        var newArray = cars.filter { car in
            return newCar.id != car.id
        }
        favorites = newArray
    }
    
    func removeCarFromFav(newCar:Car) {
        favorites = favorites.filter { car in
            return newCar.id != car.id
        }
    }
    
    func loadCars() async {
        do {
            print("⏳ Loading car data...")
            try await Task.sleep(for: .seconds(1))
            let data : CarList = load("cars.json")
            cars = data.cars
            sort()
            //load cars
            print("✅ Data loaded successfully.")
        } catch {
            print("❌ Failed to load cars:", error)
        }
        
        
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

struct CarList: Decodable{
    let cars: [Car]
}
