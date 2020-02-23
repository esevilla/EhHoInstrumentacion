//
//  PostCreateViewController.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 22/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class PostCreateViewController: UIViewController {

    @IBOutlet weak var textfieldRawPost: UITextField!
    let viewModel: PostCreateViewModel
    var textoRaw: String = ""
    var posts: AddNewPostResponse?
    
    init(viewModel: PostCreateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func ButtonSavePost(_ sender: Any) {
        textoRaw = textfieldRawPost.text!
        viewModel.didTapInTopic(raw: textoRaw)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldRawPost.placeholder = "Introduce un título"
        self.title = "Crear post"
    }
}

protocol PostCreateViewControllerProtocol: class {
    func showCreatePostsByTopic(posts: AddNewPostResponse)
    func showError(with message: String)
}

extension PostCreateViewController: PostCreateViewControllerProtocol {
    func showCreatePostsByTopic(posts: AddNewPostResponse) {
        self.posts = posts
    }
    func showError(with message: String) {
        print("Error")
    }
}
