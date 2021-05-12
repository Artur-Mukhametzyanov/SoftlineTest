//
//  StudentsListViewController.swift
//  SoftlineTest
//
//  Created by Артур Мухаметзянов on 05.05.2021.
//  Copyright © 2021 Артур Мухаметзянов. All rights reserved.
//

import UIKit

class StudentsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addStudentButton: UIButton!
    
    let addSVC = AddStudentViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appearanceCustomizer()
        readingFromUserDefaults()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension StudentsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func appearanceCustomizer() {
        addStudentButton.layer.cornerRadius = 35
        addStudentButton.layer.shadowRadius = 7
        addStudentButton.layer.shadowOpacity = 1
        addStudentButton.layer.shadowOffset = .init(width: 0, height: 3)
        addStudentButton.layer.shadowColor = UIColor.systemYellow.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editStudent",
           let addVC = segue.destination as? AddStudentViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            
            addVC.firstName = studentsList[indexPath.row].studentName
            addVC.secondName = studentsList[indexPath.row].studentSecondName
            addVC.averagePoint = studentsList[indexPath.row].studentAverage
            
            addVC.isStudentsEditing = true
            
            addVC.editStudentClosure = { [weak self] firstName, secondName, average in
                studentsList[indexPath.row].studentName = firstName
                studentsList[indexPath.row].studentSecondName = secondName
                studentsList[indexPath.row].studentAverage = Int(average)!
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            studentsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            addSVC.savingDataToUserDefaults()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        let studentArray = studentsList
        cell.studentsName.text = studentArray[indexPath.row].studentName
        cell.studentSecondName.text = studentArray[indexPath.row].studentSecondName
        cell.studentsAverage.text = String(studentArray[indexPath.row].studentAverage)
        
        return cell
    }
    
    func readingFromUserDefaults() {
        if let savedData = UserDefaults.standard.object(forKey: "students") as? Data {
            studentsList = NSKeyedUnarchiver.unarchiveObject(with: savedData) as! [Student]
        }
    }
}
