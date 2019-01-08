//
//  CreateClassViewController.swift
//  CountMe2019
//
//  Created by Uma Parhar on 1/4/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class CreateClassViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var period: UITextField!
    @IBOutlet weak var className: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var check: UILabel!
    @IBAction func doneButton(_ sender: Any) {
    }
    
    @IBAction func printInfo(_ sender: Any) {
        check.text = classesArray[0].className
    }
    var per: Int = 0
    var name: String = ""
    var firstN: String = ""
    var lastN: String = ""
    
    @IBAction func createClass(_ sender: Any) {
        per = Int(period.text!)!
        name = String(className.text!)
        var mobileapps = Classroom(per, name)
        classesArray.append(mobileapps)
    }
    @IBAction func createStudent(_ sender: Any) {
        firstN = String(firstName.text!)
        lastN = String(lastName.text!)
        var student0 = Student(firstN, lastN)
        classesArray[0].addStudent(student0)
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
