//
//  HomeView.swift
//  viper
//
//  Created by Macbook on 9/5/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    var stringCollection = [String]()

    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    func callBackData(with category: [String]) {
        stringCollection = category
        DispatchQueue.main.async {
            self.tabla.reloadData()
        }
    }
    
    func iniciar() {
        DispatchQueue.main.async {
            self.activity.startAnimating()
        }
    }
    
    func detener() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.hidesWhenStopped = true
        }
    }
    
    
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "celda")
        cell.textLabel?.text = stringCollection[indexPath.row]
        return cell
    }
}

extension HomeView: UITableViewDelegate {
    // TODO: implement view output methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.getStringNextView(data: stringCollection[indexPath.row])
    }
}
