//
//  DetallePresenter.swift
//  viper
//
//  Created by Macbook on 9/6/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class DetallePresenter  {
    
    // MARK: Properties
    weak var view: DetalleViewProtocol?
    var interactor: DetalleInteractorInputProtocol?
    var wireFrame: DetalleWireFrameProtocol?
    var datoBeforeView : String?
    
}

extension DetallePresenter: DetallePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("soy el dato \(datoBeforeView ?? "")")
        view?.showData(data : datoBeforeView ?? "")
    }
}

extension DetallePresenter: DetalleInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
