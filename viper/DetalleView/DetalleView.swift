//
//  DetalleView.swift
//  viper
//
//  Created by Macbook on 9/6/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

class DetalleView: UIViewController {
    
    @IBOutlet weak var etiqueta : UILabel!

    // MARK: Properties
    var presenter: DetallePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetalleView: DetalleViewProtocol {
    // TODO: implement view output methods
    func showData(data: String) {
        etiqueta.text = data
    }
}
