//
//  DeleteClassViewController.swift
//  CountMe2019
//
//  Created by Lauren on 3/5/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class DeleteClassViewController: UIViewController {

    @IBAction func yesDelete(_ sender: UIButton) {
        if (classesArray.count != 0)
        {
            classesArray.remove(at: classP)
        }
        classP = 0
        
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            dismiss(animated: true)
    }
    
    @IBAction func noDelete(_ sender: UIButton) {
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
