//
//  Car.swift
//  Cars
//
//  Created by Ibe Vangheluwe on 16/12/2025.
//

import Foundation

struct Car: Identifiable, Codable, Hashable{
    let id: Int
    let brand: String
    let model: String
    let year: Int
    let price: Double
    let color: String
    let fuelType: String
    let imageURL: String

}
