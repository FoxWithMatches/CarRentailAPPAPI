//
//  WelcomeViewController.swift
//  CarRentailAPP
//
//  Created by Alisa Ts on 24.11.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    private var cars: [Car] = []
    @IBOutlet var headerImage: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            headerImage.image = UIImage(named: "BMW X1")
            textLabel.text =
            """
                Позвольте найти для вас идеальный автомобиль.\n
                Подберем на любой вкус и кошелек, продолжительность проката от 1 часа до нескольких месяцев!\n
                Бронируйте прямо в приложении
            """
        }
        
        @IBAction func btn() {
            fetchData(from: Link.carLink.rawValue)
        }
        
        @IBAction func unwind(for Segue: UIStoryboardSegue) {
            
        }
        
    private func fetchData(from url: String?) {
                NetworkManager.shared.fetchCars(from: url) { result in
                    switch result {
                    case .success(let car):
                        self.cars = car
                    case .failure(let error):
                        print(error)
                    }
                }
        }
    }
