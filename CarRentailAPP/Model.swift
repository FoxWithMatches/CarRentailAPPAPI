//
//  Model.swift
//  CarRentailAPP
//
//  Created by Alisa Ts on 24.11.2021.
//

//struct Car {
//    let carNames: String
//    let price: String
//    let horsesPower: String
//    let driveUnits: String
//    let transmission: String
//    let engine: String
//    
//    var image: String {
//        "\(carNames)"
//    }
//}
//
//extension Car {
//    static func getCarList() -> [Car] {
//        var cars: [Car] = []
//        
//        let carNames = NetworkManager.shared.cars
//        let prices = NetworkManager.shared.prices
//        let horsesPowers = NetworkManager.shared.horsesPower
//        let drivesUnits = NetworkManager.shared.driveUnits
//        let transmissions = NetworkManager.shared.transmissions
//        let engines = NetworkManager.shared.engines
//        
//        for index in 0...14 {
//            let car = Car(carNames: carNames[index],
//                          price: prices[index],
//                          horsesPower: horsesPowers[index],
//                          driveUnits: drivesUnits[index],
//                          transmission: transmissions[index],
//                          engine: engines[index])
//            cars.append(car)
//        }
//        return cars
//    }
//}
