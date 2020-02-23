//
//  CategoriesRepositoryImpl.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 20/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class CategoriesRepositoryImpl: CategoriesRepository {
    let session: SessionAPI
    
    init(session: SessionAPI) {
        self.session = session
    }
    
    func getListCategories(completion: @escaping (Result<ListCategoriesResponse, Error>) -> ()) {
        let request = ListCategoriesRequest()
        session.send(request: request) { result in
            completion(result)
        }
    }
    
}
