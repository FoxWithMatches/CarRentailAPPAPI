//
//  DataManager.swift
//  CarRentailAPP
//
//  Created by Alisa Ts on 24.11.2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCars(from url: String?, completion: @escaping (_ car: [Car]) -> Void) {
            guard let url = URL(string: url ?? "") else { return }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No error description")
                    return
                }
                do {
                    let cars = try JSONDecoder().decode([Car].self, from: data)
                    DispatchQueue.main.async {
                        completion(cars)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            
            }.resume()
        }
}

