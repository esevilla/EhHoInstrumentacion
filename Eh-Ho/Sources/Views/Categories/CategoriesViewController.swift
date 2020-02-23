//
//  CategoriesViewController.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 20/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit
import Foundation

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var categoriesTable: UITableView!
    lazy var refreshControl:UIRefreshControl = {
        let refresControl = UIRefreshControl()
        refresControl.addTarget(self, action: #selector(CategoriesViewController.actualizarDatos(_:)), for: .valueChanged)
        refresControl.tintColor = UIColor.orange
        return refresControl
    }()
    let viewModel: CategoriesViewModel
    var categories : [Category] = []
    var categoriesCD : [CategoryData] = []
    var connection : Bool = true
    
    init(viewModel: CategoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTable.delegate = self
        categoriesTable.dataSource = self
        categoriesTable.rowHeight = 60
        self.title = "Categories"
        
        categoriesTable.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        
        viewModel.viewDidLoad()
        categoriesTable.refreshControl = refreshControl
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if CheckInternet.Connection() == false{
            self.Alert(Message: "No hay conexión, se mostrarán los datos offline")
        }
    }
    
    @objc func actualizarDatos(_ refresControl: UIRefreshControl){
        viewModel.viewDidLoad()
        self.categoriesTable.reloadData()
        refresControl.endRefreshing()
    }
    
    private func Alert (Message: String){
        let alert = UIAlertController(title: "Error", message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension CategoriesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if connection {
            return categories.count
        } else {
            return categoriesCD.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTable.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        if connection {
            cell.textLabel?.text = categories[indexPath.row].name
        } else {
            cell.textLabel?.text = categoriesCD[indexPath.row].name
            print("Carga de datos de las categorias desde core data")
        }
        return cell
    }
}

extension CategoriesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if connection {
            let id = categories[indexPath.row].id
            viewModel.didTapInCategory(id: id)
        } else {
            let id = categoriesCD[indexPath.row].categoryId
            viewModel.didTapInCategory(id: id)
        }
    }
}

protocol CategoriesViewControllerProtocol: class {
    func showListCategories(categories: [Category])
    func showError(with message: String)
    func showListCategoriesCD(categories: [CategoryData]) 
}

extension CategoriesViewController:  CategoriesViewControllerProtocol {
    func showError(with message: String) {
        print("Error")
    }
    func showListCategories(categories: [Category]) {
        self.categories = categories
        self.categoriesTable.reloadData()
    }
    func showListCategoriesCD(categories: [CategoryData]) {
        connection = false
        categoriesCD = categories
    }
    
}
