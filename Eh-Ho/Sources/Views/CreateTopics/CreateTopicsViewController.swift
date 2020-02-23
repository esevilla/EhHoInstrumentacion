//
//  CreateTopicsViewController.swift
//  Eh-Ho
//
//  Created by Estefania Sevilla on 22/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class CreateTopicsViewController: UIViewController {

    @IBOutlet weak var textfieldTitulo: UITextField!
    @IBOutlet weak var textfieldDescripcion: UITextField!
    let viewModel: CreateTopicsViewModel
    var topics: AddNewTopicResponse?
    var textTitle: String?
    var textDescription: String?
    
    init(viewModel: CreateTopicsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldTitulo.placeholder = "Introduce un título"
        textfieldDescripcion.placeholder = "Intoduce una descripción"

        self.title = "Crear topic"
    }

    @IBAction func buttonCrearTopic(_ sender: Any) {
        textTitle = textfieldTitulo.text
        textDescription = textfieldDescripcion.text
        
        if (textfieldTitulo.text!.count < 15) {
            showPustTopicAlert(message: "Introduce 15 caracteres como mínimo en el título")
        }else if (textfieldDescripcion.text!.count < 20) {
            showPustTopicAlert(message: "Introduce 20 caracteres como mínimo en la descripción")
        }else {
            viewModel.didTapInTopic(title: textTitle!, raw: textDescription!)
            textfieldTitulo.text = ""
            textfieldDescripcion.text = ""
        }
    }
}

protocol CreateTopicsViewControllerProtocol: class {
    func createNewTopic()
    func showError(with message: String)
}

extension CreateTopicsViewController: CreateTopicsViewControllerProtocol {
    func createNewTopic() {
        showPustTopicAlert(message: "Topic creado correctamente")
    }
    
    func showError(with message: String) {
        showPustTopicAlert(message: "Se ha producido un errorr al crear el topic")
    }
    
}

extension CreateTopicsViewController {
    
    private func showPustTopicAlert(message: String)  {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
