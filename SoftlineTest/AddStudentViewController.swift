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
    
    var firstName = ""
    var secondName = ""
    var averagePoint = 0
    var isStudentsEditing = false
    var editStudentClosure: ((String, String, String) -> ())?
    
    @IBAction func cancelButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        if validateNumField() && validateTextField() {
        
            if isStudentsEditing == true {
                editStudent()
            } else {
                addNewStudent()
            }
            
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Wrong Data Format", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appearanceCustomizer()
        getData()
    }
}

extension AddStudentViewController {
    
    func appearanceCustomizer() {
        cancelButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
    }
    
    func getData() {
        nameTextField.text = firstName
        secondNameTextField.text = secondName
        averageTextField.text = String(averagePoint)
    }

    func editStudent() {
        editStudentClosure?(nameTextField.text!, secondNameTextField.text!, averageTextField.text!)
        navigationController?.popViewController(animated: true)
    }
    
    func addNewStudent() {
        let newStudent = Student(studentName: nameTextField.text!, studentSecondName: secondNameTextField.text!, studentAverage: Int(averageTextField.text!)!)
        studentsList.append(newStudent)
        navigationController?.popViewController(animated: true)
    }
    
    func validateTextField() -> Bool {
        return nameTextField.text != "" && secondNameTextField.text != "" &&
            nameTextField.text?.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil &&
            secondNameTextField.text?.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    }
    
    func validateNumField() -> Bool {
        let availablePoints = CharacterSet(charactersIn: "12345")
        return averageTextField.text?.rangeOfCharacter(from: availablePoints) != nil &&
            averageTextField.text!.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

