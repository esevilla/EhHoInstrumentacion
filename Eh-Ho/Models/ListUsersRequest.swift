//
//  ListUsersRequest.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 23/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation


struct ListUsersRequest: APIRequest {
    
    typealias Response = ListUsersResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/latest.json"
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
