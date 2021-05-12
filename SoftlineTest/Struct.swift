//
//  Struct.swift
//  SoftlineTest
//
//  Created by Артур Мухаметзянов on 05.05.2021.
//  Copyright © 2021 Артур Мухаметзянов. All rights reserved.
//

import UIKit

var studentsList: [Student] = []

class Student: NSObject, NSCoding {
    
    var studentName: String
    var studentSecondName: String
    var studentAverage: Int
    
    init (studentName: String, studentSecondName: String, studentAverage: Int) {
        self.studentName = studentName
        self.studentSecondName = studentSecondName
        self.studentAverage = studentAverage
    }
    
    required init (coder aDecoder: NSCoder) {
        studentName = aDecoder.decodeObject(forKey: "studentName") as! String
        studentSecondName = aDecoder.decodeObject(forKey: "studentSecondName") as! String
        studentAverage = aDecoder.decodeInteger(forKey: "studentAverage")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(studentName, forKey: "studentName")
        aCoder.encode(studentSecondName, forKey: "studentSecondName")
        aCoder.encode(studentAverage, forKey: "studentAverage")
    }
}




