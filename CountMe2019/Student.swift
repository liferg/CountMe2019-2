//
//  Student.swift
//  CountMe2019
//
//  Created by Uma Parhar on 1/3/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import os.log
class Student: NSObject, Codable {
    var firstName: String
    var lastName: String
    var studentParticipation = [Date: Int]()
    init(_ fN: String, _ lN: String)
    {
        self.firstName = fN
        self.lastName = lN

    }
}
