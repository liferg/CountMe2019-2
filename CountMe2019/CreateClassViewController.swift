//
//  CreateClassViewController.swift
//  CountMe2019
//
//  Created by Uma Parhar on 1/4/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class CreateClassViewController: UIViewController{

    var persistentStudent = PersistentData()
    var persistentClassroom = ClassroomPersistentData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        persistentStudent.restore(fileName: "test1")
        persistentClassroom.restore(fileName: "test2")
        // Do any additional setup after loading the view.
    }
    
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
    
    //
    var per: Int = 0
    var name: String = ""
    var firstN: String = ""
    var lastN: String = ""
    var classIndex: Int = 0
    var nameCheck: String = ""
    var newClassCheck = 0
    
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
    @IBAction func createStudent(_ sender: Any) {
        if newClassCheck == 1 {
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
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
