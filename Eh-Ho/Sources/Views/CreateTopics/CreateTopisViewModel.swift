//
//  CreateTopisViewModel.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 22/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class CreateTopicsViewModel  {
    
    weak var view: CreateTopicsViewControllerProtocol?
    let router : CreateTopicsRouter
    let topicRepository: TopicsRepository
    
    init(router : CreateTopicsRouter, topicRepository: TopicsRepository) {
        self.router = router
        self.topicRepository = topicRepository
    }
    
    func didTapInTopic(title: String, raw: String) {
        createNewPostByTopic(title: title, raw: raw)
        router.navigateToPosts()
    }
    
    private func createNewPostByTopic(title: String, raw: String) {
        topicRepository.createNewTopic(title: title, raw: raw) { [weak self] result in
            switch result {
            case .success( _):
                self?.view?.createNewTopic()
            case .failure:
                self?.view?.showError(with: "Error")
            }
        }
    }
    
}
