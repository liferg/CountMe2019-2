//
//  CreateClassViewController.swift
//  CountMe2019
//
//  Created by Uma Parhar on 1/4/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit


class CreateClassViewController: UIViewController{
    
    
    
    // outlets
    @IBOutlet weak var period: UITextField!
    @IBOutlet weak var periodFinal: UILabel!
    @IBOutlet weak var className: UITextField!
    @IBOutlet weak var classNameFinal: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var submitClass: UIButton!
    @IBOutlet weak var countVal: UILabel!
    @IBAction func doneButton(_ sender: Any) {
    }
    
    // loading functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        // updates class count if student is added while a class in on this view
        if (classesArray.count != 0 && periodFinal.text != ""){
            countVal.text = String(classesArray[classIndex].classList.count)
        }
    }
    
    // variables
    var per: Int = 0
    var name: String = ""
    var firstN: String = ""
    var lastN: String = ""
    var classIndex: Int = 0
    var nameCheck: String = ""
    var newClassCheck = 0
    
    // creates new class (submit button)
    @IBAction func createClass(_ sender: Any) {
        if period.text != "" && className.text != "" {
            per = Int(period.text!)!
            name = String(className.text!)
            if newClassCheck == 0 {
                var newClass = Classroom(per, name)
                classesArray.append(newClass)
                classIndex = classesArray.firstIndex(of: newClass) ?? 0
                newClassCheck = 1
            }
            classesArray[classIndex].className = name
            classesArray[classIndex].classPeriod = per
            periodFinal.text = String(per)
            classNameFinal.text = name
            period.text = ""
            className.text = ""
            submitClass.setTitle("Submit Edit" , for: .normal)
        }
    }
    
    // creates new student (add button)
    @IBAction func createStudent(_ sender: Any) {
        if newClassCheck == 1 {
            if firstName.text != "" && lastName.text != "" {
                firstN = String(firstName.text!)
                lastN = String(lastName.text!)
                var student = Student(firstN, lastN)
                classesArray[classIndex].addStudent(student)
                firstName.text = ""
                lastName.text = ""
                let countText = String(classesArray[classIndex].classList.count)
                countVal.text = countText
            }
        }
    }
    
    // refreshes page for additonal class to be added
    @IBAction func allDone(_ sender: Any) {
        period.text = ""
        className.text = ""
        periodFinal.text = ""
        classNameFinal.text = ""
        firstName.text = ""
        lastName.text = ""
        countVal.text = "0"
        submitClass.setTitle("Submit" , for: .normal)
        per = 0
        name = ""
        firstN = ""
        lastN = ""
        classIndex = 0
        nameCheck = ""
        newClassCheck = 0
    }
    
    @IBAction func addTestingClass(_ sender: Any) {
        let testClass = Classroom(1, "Spanish II")
        classesArray.append(testClass)
        for i in stride(from: 1, to: 51, by: 1) {
            testClass.addStudent(Student("student", String(i)))
        }
    }
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
