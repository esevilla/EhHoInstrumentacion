//
//  CategoriesRepository.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 20/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

protocol CategoriesRepository {
    func getListCategories(completion: @escaping(Result<ListCategoriesResponse, Error>) -> ())
}
