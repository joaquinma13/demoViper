//
//  HomePresenter.swift
//  viper
//
//  Created by Macbook on 9/5/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class HomePresenter  {
    
    var stringCollection = [String]()
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        //Se consulta al interactor para extraer los datos remotos
        interactor?.getExternalData()
        view?.iniciar()
    }
    
    func getStringNextView(data: String) {
        wireFrame?.presentNextView(from: view!, object: data)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func callBackData(with category: [CategoryUrl]) {
        stringCollection.removeAll()
        for aux1 in category{
            for aux2 in aux1._links.selfito{
                stringCollection.append(aux2.href)
            }
        }
        view?.callBackData(with: stringCollection)
        view?.detener()
    }
}
