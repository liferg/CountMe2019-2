//
//  DatePopUpViewController.swift
//  CountMe2019
//
//  Created by Uma Parhar on 3/15/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class DatePopUpViewController: UIViewController {
    private var datePicker: UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(DatePopUpViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DatePopUpViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        DateTextField.inputView = datePicker
        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    @IBOutlet weak var DateTextField: UITextField!
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        DateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @IBAction func DonePopUp(_ sender: Any) {
        self.removeAnimate()
        currentDate = DateTextField.text ?? ""
        var check: Bool = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        /*for i in stride(from:0, to: classesArray[classP].classList.count, by:1)
         {
         if(classesArray[classP].classList[i].studentParticipation[currentDate] = nil)
         {
         check == false
         }
         }
         */
        /*for i in stride(from: 0, to: classesArray[classP].classList[0].studentParticipation.count, by:1)
         {
         if(classesArray[classP].classList[0].studentParticipation[i] == currentDate)
         {
         check = false
         }
         }
         
         if(check == true)
         {
         */
        for (Date, numbers) in classesArray[classP].classList[0].studentParticipation
        {
            if Date == currentDate
            {
                check = false
            }
        }
        if(check == true)
        {
            if(classesArray.count != 0 && classesArray[classP].classList.count != 0)
            {
                for i in stride(from:0, to: classesArray[classP].classList.count, by:1)
                {
                    classesArray[classP].classList[i].studentParticipation.updateValue(0, forKey: currentDate)
                    
                    //classesArray[classP].classList[i].studentParticipation[classesArray[classP].classList[i].studentParticipation.count] = [currentDate : y]
                }
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool) in
            if(finished)
            {
                self.view.removeFromSuperview()
            }
        });
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
