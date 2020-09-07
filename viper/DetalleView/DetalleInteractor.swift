//
//  DetalleInteractor.swift
//  viper
//
//  Created by Macbook on 9/6/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class DetalleInteractor: DetalleInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: DetalleInteractorOutputProtocol?
    var localDatamanager: DetalleLocalDataManagerInputProtocol?
    var remoteDatamanager: DetalleRemoteDataManagerInputProtocol?

}

extension DetalleInteractor: DetalleRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
