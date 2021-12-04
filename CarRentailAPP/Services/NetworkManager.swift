//
//  DataManager.swift
//  CarRentailAPP
//
//  Created by Alisa Ts on 24.11.2021.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCars(from url: String?, completion: @escaping(Result<[Car], NetworkError>) -> Void) {
            guard let url = URL(string: url ?? "") else {
                completion(.failure(.invalidURL))
                return
            }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                do {
                    let cars = try JSONDecoder().decode([Car].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(cars))
                    }
                } catch {
                    completion(.failure(.decodingError))
                }
            }.resume()
        }
}

