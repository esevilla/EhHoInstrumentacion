//
//  PostViewModel.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 20/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class PostViewModel {
    
    weak var  view: PostsViewControllerProtocol?
    private let mDataManagerPost = DataManager()
    let router: PostRouter
    let id: Int
    let postsRepository: PostsRepository
    let topicRepository: TopicsRepository
    
    init(router: PostRouter, id: Int, postsRepository: PostsRepository, topicRepository: TopicsRepository) {
        self.router = router
        self.id = id
        self.postsRepository = postsRepository
        self.topicRepository = topicRepository
    }
    
    private func fetchListPostssByTopic () {
        if CheckInternet.Connection() {
            postsRepository.getListPostssByTopic(id: id) { [weak self] result in
                switch result {
                case .success(let value):
                    self?.view?.showListPostssByTopic(posts: value.postStream.posts)
                    self?.mDataManagerPost.savePosts(post: value.postStream.posts)
                    self?.mDataManagerPost.saveLastDownload()
                case .failure:
                    self?.view?.showError(with: "Error")
                }
            }
        } else {
            self.view?.showListPostsCD(post: mDataManagerPost.dataPosts(id: id))
        }
    }
    
    func viewDidLoad() {
        fetchListPostssByTopic()
    }
    
    func didTapInTopic(id: Int) {
        router.navigateToPosts(id: id)
    }
    
    func didUpDateTopic(title: String) {
        updateSingleTopic(title: title)
    }
    
    private func updateSingleTopic(title: String) {
        topicRepository.updateSingleTopic(idTopic: id, title: title) { [weak self] result in
            switch result {
            case .success:
                print("Ok")
            case .failure:
                self?.view?.showError(with: "Error")
                print("No se ha podido actualizar el topic")
            }
        }
    }
    
}
