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

// date object with time
var currentDate = Date()
// date object without time
var newCurrentDate = Date()

// takes off time from date() variable
// needs to be called in view controllers
func stripTime(from passedDate: Date) -> Date {
    let components = Calendar.current.dateComponents([.year, .month, .day], from: passedDate)
    let newDate = Calendar.current.date(from: components)!
    return newDate
}

// variable to check decrement or increment
var edit: Bool = true

