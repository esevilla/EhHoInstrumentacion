//
//  UsersRepositoryImpl.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 23/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class UsersRepositoryImpl: UsersRepository {
    let session: SessionAPI
    
    init(session: SessionAPI) {
        self.session = session
    }
    
    func getListUsers(completion: @escaping (Result<ListUsersResponse, Error>) -> ()) {
        let request = ListUsersRequest()
        session.send(request: request) { (result) in
            completion(result)
        }
    }
    
}
