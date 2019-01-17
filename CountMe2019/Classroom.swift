//
//  Classroom.swift
//  CountMe2019
//
//  Created by Uma Parhar on 1/3/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
class Classroom: NSObject {
    var classPeriod: Int
    var className: String
    var classList = [Student]()
    var count: Int
    init(_ period: Int, _ cN: String)
    {
        self.classPeriod = period
        self.className = cN
        self.count = 0
    }
    func addStudent(_ stud: Student) {
        classList.append(stud)
    }
}
