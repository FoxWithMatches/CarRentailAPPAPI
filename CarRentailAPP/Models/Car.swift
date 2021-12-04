//
//  Car.swift
//  CarRentailAPP
//
//  Created by Alisa Ts on 04.12.2021.
//

struct Car: Decodable {
    let name: String?
    let horsePower: Double?
    let price: Double?
    let imgUrl: String?
    
    init(carData: [String: Any]) {
        name = carData["name"] as? String
        horsePower = carData["avg_horsepower"] as? Double
        price = carData["avg_price"] as? Double
        imgUrl = carData["img_url"] as? String
    }
    
    static func getCar(from value: Any) -> [Car] {
        guard let carData = value as? [[String: Any]] else { return [] }
        return carData.compactMap { Car(carData: $0) } 
    }
}

enum Link: String {
    case carLink = "https://private-anon-3debd1bd9d-carsapi1.apiary-mock.com/manufacturers"
}
