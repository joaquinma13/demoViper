//
//  CategoryUrl.swift
//  viper
//
//  Created by Macbook on 9/6/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

struct CategoryUrl:Codable {
    
    
    var _links : Links
    
    struct Links:Codable {
        
        var selfito:[datoUrl]
        
        enum CodingKeys: String, CodingKey{
            case selfito = "self"
        }
    }
    
    struct datoUrl:Codable {
        var href:String
    }
}
