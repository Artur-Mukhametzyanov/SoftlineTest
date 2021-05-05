//
//  Struct.swift
//  SoftlineTest
//
//  Created by Артур Мухаметзянов on 05.05.2021.
//  Copyright © 2021 Артур Мухаметзянов. All rights reserved.
//

import Foundation

var studentsList: [Student] = [ Student(studentName: "Маша Павлова", studentAverage: 5),
                                Student(studentName: "Паша Марьев", studentAverage: 4),
                                Student(studentName: "Саша Дарьев", studentAverage: 5),
                                Student(studentName: "Даша Александрова", studentAverage: 3),
                                Student(studentName: "Сережа Русланов", studentAverage: 5),
                                Student(studentName: "Руслан Сергеев", studentAverage: 2),
                                Student(studentName: "Рафик Андреев", studentAverage: 5),
                                Student(studentName: "Андрей Рафиков", studentAverage: 1),
                                Student(studentName: "Марат Олегович", studentAverage: 5),
                                Student(studentName: "Оля Маратова", studentAverage: 3),
                                Student(studentName: "Алина Гузелева", studentAverage: 5),
                                Student(studentName: "Гузель Алинова", studentAverage: 3),
                                Student(studentName: "Наташа Димова", studentAverage: 5),
                                Student(studentName: "Дима Наташев", studentAverage: 4),
                                Student(studentName: "Рамиль Гарифов", studentAverage: 5),
]

struct Student {
    var studentName: String
    var studentAverage: Int
}




