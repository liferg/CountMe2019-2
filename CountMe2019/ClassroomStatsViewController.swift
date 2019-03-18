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
    
    // loading functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        classroomStatsTableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        classroomStatsTableView.reloadData()
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
        classStatsCell.textLabel?.text = name.firstName + " " + name.lastName
        if (classesArray[classP].classList[indexPath.row].count != 0)
        {
            let count = classesArray[classP].classList[indexPath.row].count
            classStatsCell.studentCountLabel.text = String(count)
        }
        return(classStatsCell)
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
        return classesArray[row].className
    }
    // what it will do when you select or scroll to a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        classP = row
        classroomStatsTableView.reloadData()
    }
    



}
