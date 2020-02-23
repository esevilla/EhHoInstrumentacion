//
//  TopicData.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 21/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class TopicData {
    
    var topicId: Int = -1
    var title: String = ""
    var categoryId: Int = 0
    var views: Int = 0
    
    convenience init(topicId: Int = -1, title: String, categoryId: Int, views: Int) {
        self.init()
        self.topicId = topicId
        self.title = title
        self.categoryId = categoryId
        self.views = views
        
    }
}
