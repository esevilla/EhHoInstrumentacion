//
//  MessagesPrivatesRepositoryImpl.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 23/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class MessagesPrivatesRepositoryImpl: MessagesPrivatesRepository {
    let session: SessionAPI
    
    init(session: SessionAPI) {
        self.session = session
    }
    
    func createSendNewMessagePrivate(title: String, raw: String, target_usernames: String, completion: @escaping (Result<SendNewMessagePrivateResponse, Error>) -> ()) {
        let request = SendNewMessagePrivateRequest(title: title, raw: raw, target_usernames: target_usernames)
        session.send(request: request) { (result) in
            completion(result)
        }
    }
    
}
