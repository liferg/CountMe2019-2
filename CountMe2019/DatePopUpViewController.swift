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
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(DatePopUpViewController.dateChanged(datePicker:)), for: .valueChanged)
        DateTextField.text = String(describing: currentDate)
        if datePicker == nil
        {
            DateTextField.text = String(describing: currentDate)
        }
        else
        {
            DateTextField.inputView = datePicker
        }
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
        //currentDate = DateTextField.text ?? ""
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
        for (date1, numbers) in classesArray[0].classList[0].studentParticipation
        {
            check =  Calendar.current.isDateInToday(date1)
            if check
            {
                return
            }
        }
        if(check == false)
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
        dismiss(animated: true)
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
