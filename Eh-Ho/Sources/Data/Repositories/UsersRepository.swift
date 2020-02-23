//
//  UsersRepository.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 23/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

protocol UsersRepository {
    func getListUsers(completion: @escaping(Result<ListUsersResponse, Error>) -> ())
}
