//
//  UserData.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 21/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class UserData {
    
    var name: String = ""
    var userName: String = ""
    var idUser: Int = -1
    
    convenience init(name: String, userName: String, idUser: Int) {
        self.init()
        
        self.name = name
        self.userName = userName
        self.idUser = idUser
    }
}
