//
//  MessagesPrivatesRepository.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 23/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

protocol MessagesPrivatesRepository {
    func createSendNewMessagePrivate(title: String, raw: String, target_usernames: String, completion: @escaping(Result<SendNewMessagePrivateResponse, Error>) -> ())
}
