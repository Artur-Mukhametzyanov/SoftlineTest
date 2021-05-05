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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        appearanceCustomize()
    }
}

extension StudentsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func appearanceCustomize() {
        
        addStudentButton.layer.cornerRadius = 10
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        let studentArray = studentsList
        cell.studentsName.text = studentArray[indexPath.row].studentName
        cell.studentsAverage.text = String(studentArray[indexPath.row].studentAverage)
        
        return cell
    }
}

