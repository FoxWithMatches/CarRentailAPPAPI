//
//  Car.swift
//  CarRentailAPP
//
//  Created by Alisa Ts on 04.12.2021.
//

struct Car: Decodable {
    let name: String?
    let avg_horsepower: Double?
    let avg_price: Double?
    let img_url: String?
}

enum Link: String {
    case carLink = "https://private-anon-3debd1bd9d-carsapi1.apiary-mock.com/manufacturers"
}
