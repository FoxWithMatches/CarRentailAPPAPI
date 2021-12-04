//
//  CarListViewController.swift
//  CarRentailAPP
//
//  Created by Alisa Ts on 24.11.2021.
//

import UIKit

class CarListViewController: UITableViewController {

    private var cars: [Car] = []
        private var filterCars = [Car]()
        private let searchController = UISearchController(searchResultsController: nil)
        private var searchBarIsEmpty: Bool {
            guard let text = searchController.searchBar.text else { return false }
            return text.isEmpty
        }
        private var isFiltering: Bool {
            return searchController.isActive && !searchBarIsEmpty
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.rowHeight = 80
            
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Поиск"
            navigationItem.searchController = searchController
            definesPresentationContext = true
            
            fetchData(from: Link.carLink.rawValue)
        }

        // MARK: - Table view data source

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if isFiltering {
                return filterCars.count
            }
            return cars.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rental", for: indexPath) as! CarCell
            
            var car: Car
            if isFiltering {
                car = filterCars[indexPath.row]
            } else {
                car = cars[indexPath.row]
            }

            cell.configure(with: car)

            return cell
        }
       
        // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let car: Car
            
            if isFiltering {
                car = filterCars[indexPath.row]
            } else {
                car = cars[indexPath.row]
            }
        }
        
        private func fetchData(from url: String?) {
            NetworkManager.shared.fetchCars(from: url) { car in
                self.cars = car
                self.tableView.reloadData()
            }
        }
    }
    extension CarListViewController: UISearchResultsUpdating {
        func updateSearchResults(for searchController: UISearchController) {
            filterContentForSearchText(searchController.searchBar.text!)
        }
        
        private func filterContentForSearchText(_ searchText: String) {
            filterCars = cars.filter({ (car: Car) -> Bool in
                return car.name?.lowercased().contains(searchText.lowercased()) ?? true
            })
            
            tableView.reloadData()
        }
    }
