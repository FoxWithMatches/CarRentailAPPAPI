//
//  CarCell.swift
//  CarRentailAPP
//
//  Created by Alisa Ts on 04.12.2021.
//

import UIKit

class CarCell: UITableViewCell {

    @IBOutlet var carImage: UIImageView!
    @IBOutlet var carName: UILabel!
    
    func configure(with car: Car) {
        carName.text = car.name
        
        DispatchQueue.global().async {
            guard let stringURL = car.imgUrl else { return }
            guard let url = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.carImage.image = UIImage(data: imageData)
            }
        }
    }
}
