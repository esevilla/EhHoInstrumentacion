//
//  CategoryData.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 21/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class CategoryData {
    
    var categoryId: Int = -1
    var name: String = ""
    
    convenience init(categoryId: Int = -1, name: String) {
        self.init()
        self.categoryId = categoryId
        self.name = name
    }
}
