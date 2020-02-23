//
//  PostsViewController.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 20/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    @IBOutlet weak var tableViewPosts: UITableView!
    var posts : [Post2] = []
    var postsCD : [PostData] = []
    var connection : Bool = true
    let viewModel : PostViewModel
    var id: Int = 0
    var newTitle: String = ""
    var editable_topic: Bool = false
    
    lazy var refreshControl:UIRefreshControl = {
        let refresControl = UIRefreshControl()
        refresControl.addTarget(self, action: #selector(PostsViewController.actualizarDatos(_:)), for: .valueChanged)
        refresControl.tintColor = UIColor.orange
        return refresControl
    }()
    
    @objc func actualizarDatos(_ refresControl: UIRefreshControl){
        viewModel.viewDidLoad()
        self.tableViewPosts.reloadData()
        refresControl.endRefreshing()
    }
    
    init(viewModel : PostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPosts.dataSource = self
        tableViewPosts.delegate = self
        tableViewPosts.rowHeight = 60
        self.title = "Posts"
        
        tableViewPosts.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        viewModel.viewDidLoad()
        
        tableViewPosts.refreshControl = refreshControl
    }
    
    func setupUI() {
        let editTopic = UIBarButtonItem(title: "Editar topic", style: .plain, target: self, action: #selector(displayEdit))
        navigationItem.rightBarButtonItems = [editTopic]
    }
    
    @objc func displayEdit() {
       showPustTopicAlert()
    }
    
    private func showPustTopicAlert()  {
        let alert = UIAlertController(title: "Editar topic", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "Introduce un título"
            UITextField.textAlignment = .center
        }
        
        let action = UIAlertAction(title: "Ok", style: .default) { [unowned alert] _ in
            self.newTitle = alert.textFields![0].text!
            self.viewModel.didUpDateTopic(title: self.newTitle)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func ButtonAddPost(_ sender: Any) {
        viewModel.didTapInTopic(id: self.id)
    }
}

extension PostsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if connection {
            return posts.count
        } else {
            return postsCD.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewPosts.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        
        if connection {
            cell.textLabel?.text = posts[indexPath.row].cooked
            id = posts[indexPath.row].topicID
            editable_topic  = posts[indexPath.row].canEdit
        } else {
            cell.textLabel?.text = postsCD[indexPath.row].cooked
            id = postsCD[indexPath.row].topicId
            editable_topic  = postsCD[indexPath.row].canEdit
        }
        
        if (editable_topic) {
            setupUI()
        }
        
        return cell
    }
    
}

protocol PostsViewControllerProtocol: class {
    func showListPostssByTopic(posts: [Post2])
    func showError(with message: String)
    func showListPostsCD(post: [PostData])
}

extension PostsViewController: PostsViewControllerProtocol {
    func showListPostssByTopic(posts: [Post2]) {
        self.posts = posts
        self.tableViewPosts.reloadData()
    }
    
    func showError(with message: String) {
        print("Error")
    }
    
    func showListPostsCD(post: [PostData]) {
        connection = false
        postsCD = post
    }
}

extension PostsViewController: UITableViewDelegate {
}
