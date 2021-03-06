//
//  ClassroomStatsViewController.swift
//  CountMe2019
//
//  Created by SIEVWRIGHT, CORINN on 1/2/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class ClassroomStatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // outlets
    @IBOutlet weak var classroomStatsTableView: UITableView!
    @IBOutlet weak var ClassPicker: UIPickerView!
    
    var calculated: Bool = false
    
    // loading functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        classroomStatsTableView.reloadData()
        ClassPicker.selectRow(classP, inComponent: 0, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
        //datePicker
        datePicker = UIDatePicker()
        datePicker?.setDate(newCurrentDate, animated: false)
        datePicker?.datePickerMode = .date
        dateChanged(datePicker: datePicker!)
        datePicker?.addTarget(self, action: #selector(ClassroomStatsViewController.dateChanged(datePicker:)), for: .valueChanged)
        StartDateText.inputView = datePicker
        //datePicker2
        datePicker2 = UIDatePicker()
        datePicker2?.datePickerMode = .date
        datePicker2?.setDate(newCurrentDate, animated: false)
        dateChanged(datePicker2: datePicker2!)
        datePicker2?.addTarget(self, action: #selector(ClassroomStatsViewController.dateChanged(datePicker2:)), for: .valueChanged)
        EndDateText.inputView = datePicker2
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        
        // strip time
        newCurrentDate = stripTime(from: currentDate)
        
        calculated = false
        
    }
    @objc func loadList(notification: NSNotification){
        //load data here
        classroomStatsTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        classroomStatsTableView.reloadData()
        ClassPicker.selectRow(classP, inComponent: 0, animated: true)
        calculated = false
    }
    
    // TABLE VIEW FUNCTIONS
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(classesArray.count != 0){
            return classesArray[classP].classList.count
        }
        else {
            return 0
        }
    }
    // decides what is in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let classStatsCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "classStatsCell") as! ClassroomStatsTableViewCell
        
        let classStatsCell = tableView.dequeueReusableCell(withIdentifier: "classStatsCell", for: indexPath) as! ClassroomStatsTableViewCell
        let name = classesArray[classP].classList[indexPath.row]
        var count: Int = 0
        classStatsCell.textLabel?.text = name.firstName + " " + name.lastName
        
        // display count according to start and end date
        // goes through studentParticipationArray
        if (calculated)
        {
            for dateCount in classesArray[classP].classList[indexPath.row].studentParticipation
            {
                //checks if there is student participation at the date - if not it won't try to find a count for that day
                if(classesArray[classP].classList[indexPath.row].studentParticipation[dateCount.key] != nil)
                {
                    
                    //testing to see if it counts participation count correctly
                    //classesArray[classP].classList[indexPath.row].studentParticipation[datePicker!.date] = 4
                    //if the date within the array is within the selected dates, it adds the count to the count that will be displayed
                    
                    if(datePicker!.date <= dateCount.key && dateCount.key <= datePicker2!.date)
                    {
                        count = count + dateCount.value
                        
                        // If it breaks with multiple dates this is why
                        
                        classStatsCell.studentCountLabel.text = String(count)
                    }
                }
            }
        }
        else
        {
            classStatsCell.studentCountLabel.text = ""
        }
        
        return classStatsCell
    }
    
    //refresh with submit button
    @IBAction func submit(_ sender: Any) {
        calculated = true
        classroomStatsTableView.reloadData()
    }
    
    // PICKER VIEW FUNCTIONS
    
    // components of pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return classesArray.count
    }
    // title of row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return classesArray[row].className + " - " + String(classesArray[row].classPeriod)
    }
    // what it will do when you select or scroll to a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        classP = row
        classroomStatsTableView.reloadData()
    }
    
    // DATE PICKER FUNCTIONS
    
    private var datePicker: UIDatePicker?
    private var datePicker2: UIDatePicker?
    @IBOutlet weak var StartDateText: UITextField!
    
    @IBOutlet weak var EndDateText: UITextField!
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        StartDateText.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker2: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        EndDateText.text = dateFormatter.string(from: datePicker2.date)
        view.endEditing(true)
    }
    
    
}

