import Foundation
@Observable
class DataManager {
    var cars: [Car] = []
     
    
    func sort() {
        cars.sort { car1, car2 in
            return car1.id < car2.id
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
