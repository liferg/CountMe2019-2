//
//  Classroom.swift
//  CountMe2019
//
//  Created by Uma Parhar on 1/3/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
class Classroom: NSObject, Codable {
    var classPeriod: Int
    var className: String
    var classList = [Student]()
    init(_ period: Int, _ cN: String)
    {
        self.classPeriod = period
        self.className = cN
    }
    func addStudent(_ stud: Student) {
        classList.append(stud)
    }
}
