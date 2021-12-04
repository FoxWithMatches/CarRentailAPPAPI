//
//  DetailCarViewController.swift
//  CarRentailAPP
//
//  Created by Alisa Ts on 24.11.2021.
//

import UIKit

class DetailCarViewController: UIViewController {

    @IBOutlet var imageCar: UIImageView!
    @IBOutlet var carDescriptionLabel: UILabel!


    var car: Car!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let name = car.name else { return }
        guard let horsePower = car.avg_horsepower else { return }
        guard let price = car.avg_price else { return }
        carDescriptionLabel.text =
        """
            \(name.capitalized) \n
            Данный автомобиль мощностью \(String(format: "%.2f", horsePower)) лошадиных сил.
            Цена: \(String(format: "%.2f", price)) $
        """
        DispatchQueue.global().async {
            guard let stringURL = self.car.img_url else { return }
            guard let url = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.imageCar.image = UIImage(data: imageData)
            }
        }
    }
//
//    // MARK: - Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let reserveVC = segue.destination as? ReserveViewController else { return }
//        reserveVC.car = car
//    }
}
