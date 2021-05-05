//
//  AddStudentViewController.swift
//  SoftlineTest
//
//  Created by Артур Мухаметзянов on 05.05.2021.
//  Copyright © 2021 Артур Мухаметзянов. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var averageTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func cancelButton(_ sender: Any) {
    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appearanceCustomizer()
    }
}

extension AddStudentViewController {
    
    func appearanceCustomizer() {
        
        cancelButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
    }
}
