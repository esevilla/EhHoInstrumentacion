//
//  ListUsersResponse.swift
//  Eh-Ho
//
//  Created by Ignacio Garcia Sainz on 17/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct ListUsersResponse: Codable {
    let users: [User4]

    enum CodingKeys: String, CodingKey {
        case users
    }
}

// MARK: - User
struct User4: Codable {
    let id: Int
    let username, name, avatarTemplate: String
    
    enum CodingKeys: String, CodingKey {
        case id, username, name
        case avatarTemplate = "avatar_template"
    }
}
