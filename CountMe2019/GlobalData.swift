//
//  GlobalData.swift
//  CountMe2019
//
//  Created by Corinn on 1/4/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation

// array of classes
var classesArray = [Classroom]()
// index changed across view controllers 
var classP: Int = 0
var student = PersistentData("", "")
let date = Date()
let calendar = Calendar.current
let day = calendar.component(.day, from: date)
let month = calendar.component(.month, from: date)
let year = calendar.component(.year, from: date)
var currentDate = "Select Date"

