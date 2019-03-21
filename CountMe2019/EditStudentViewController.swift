//
//  EditStudentViewController.swift
//  CountMe2019
//
//  Created by Lauren on 3/21/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class EditStudentViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        var newFirst = firstName.text
        var newLast = lastName.text
        classesArray[classP].classList[studentIndex].firstName = newFirst!
        classesArray[classP].classList[studentIndex].lastName = newLast!
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var stud = classesArray[classP].classList[studentIndex]
        firstName.text = stud.firstName
        lastName.text = stud.lastName
        
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
