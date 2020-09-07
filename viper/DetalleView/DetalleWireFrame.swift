//
//  DetalleWireFrame.swift
//  viper
//
//  Created by Macbook on 9/6/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

class DetalleWireFrame: DetalleWireFrameProtocol {

    class func createDetalleModule(data : String) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "detalleView")
        if let view = viewController as? DetalleView {
            let presenter: DetallePresenterProtocol & DetalleInteractorOutputProtocol = DetallePresenter()
            let interactor: DetalleInteractorInputProtocol & DetalleRemoteDataManagerOutputProtocol = DetalleInteractor()
            let localDataManager: DetalleLocalDataManagerInputProtocol = DetalleLocalDataManager()
            let remoteDataManager: DetalleRemoteDataManagerInputProtocol = DetalleRemoteDataManager()
            let wireFrame: DetalleWireFrameProtocol = DetalleWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.datoBeforeView = data
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetalleView", bundle: Bundle.main)
    }
    
}
