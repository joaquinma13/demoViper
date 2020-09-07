//
//  HomeRemoteDataManager.swift
//  viper
//
//  Created by Macbook on 9/5/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var getUrl = [CategoryUrl]()
    
    func externalGetData() {

        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://cfeapps.com/wp-json/wp/v2/categories")!)
        request.httpMethod = "GET"
        
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")

        
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            
            guard let data = data, error == nil, let respuesta = response  as? HTTPURLResponse else{
                print("Error de conexion ")
                return
            }
            
            if respuesta.statusCode == 200{
                
                print("Respuesta \(data)")
                do {
                    
                    let decoder = JSONDecoder()
                    self.getUrl = try decoder.decode([CategoryUrl].self, from: data)
                    self.remoteRequestHandler?.callBackData(with: self.getUrl)
                    
                } catch {
                    print("error \(error.localizedDescription)")
                }
            }else{
                print(" error  \(respuesta.statusCode)")
            }
        })

        task.resume()
    }
    
}
