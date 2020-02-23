//
//  ListCategoriesRequest.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 20/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct ListCategoriesRequest: APIRequest {
    
    typealias Response = ListCategoriesResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/categories.json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
}
