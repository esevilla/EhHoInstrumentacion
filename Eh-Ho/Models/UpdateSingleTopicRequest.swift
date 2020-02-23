//
//  UpdateSingleTopicRequest.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 23/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct UpdateSingleTopicRequest: APIRequest {
    
    typealias Response = UpdateSingleTopicResponse
    
    let title: String
    let topicId: Int
   
    init(title: String,
         topicId: Int) {
        self.title = title
        self.topicId = topicId
    }
    
    var method: Method {
        return .PUT
    }
    
    var path: String {
        return "/t/-/\(topicId).json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return ["title": title]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
