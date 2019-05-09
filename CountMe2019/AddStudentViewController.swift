//
//  AddStudentViewController.swift
//  CountMe2019
//
//  Created by Lauren on 3/6/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        var first = String(fName.text!)
        var last = String(lName.text!)
        var stud = Student(first, last)
        
        if(classesArray.count != 0)
        {
            classesArray[classP].addStudent(stud)
            let studentIndex = classesArray[classP].classList.count - 1
            
            newCurrentDate = stripTime(from: currentDate)
            
            classesArray[classP].classList[studentIndex].studentParticipation.updateValue(0, forKey: newCurrentDate)
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
