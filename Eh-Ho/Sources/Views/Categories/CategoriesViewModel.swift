//
//  CategoriesViewModel.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 20/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class CategoriesViewModel {
    
    weak var view: CategoriesViewControllerProtocol?
    
    private let mDataManagerCategories = DataManager()
    
    let router: CategoriesRouter
    let categoriesRepository: CategoriesRepository
    
    init(router: CategoriesRouter, categoriesRepository: CategoriesRepository) {
        self.router = router
        self.categoriesRepository = categoriesRepository
    }
    
    func viewDidLoad() {
        fetchListCategories()
    }
    
    func didTapInCategory(id: Int) {
        router.navigateToTopicsById(id: id)
    }
    
    private func fetchListCategories() {
        
        if CheckInternet.Connection() {
        categoriesRepository.getListCategories { [weak self] result  in
            switch result {
            case .success(let value):

                self?.view?.showListCategories(categories: value.categoryList.categories)
                self?.mDataManagerCategories.saveCategories(category: value.categoryList.categories)
                self?.mDataManagerCategories.saveLastDownload()
            case .failure:
                self?.view?.showError(with: "Error")
            }
        }
            
        } else {
            print("No hay conexión a internet.")
            self.view?.showListCategoriesCD(categories: self.mDataManagerCategories.dataCategories() )
        }
    }
        

    
}
