//
//  PostsRepository.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 20/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

protocol PostsRepository {
    func getListPostssByTopic(id: Int, completion: @escaping(Result<ListPostsByTopicResponse, Error>) -> ())
    func createNewPost(id_topic: Int, raw: String, completion: @escaping(Result<AddNewPostResponse, Error>) -> ())
}
