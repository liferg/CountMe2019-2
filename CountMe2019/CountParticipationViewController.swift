//
//  FirstViewController.swift
//  CountMe2019
//
//  Created by SIEVWRIGHT, CORINN on 1/2/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

var studentIndex = 0

class CountParticipationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // outlets
    @IBOutlet weak var editClassTableView: UITableView!
    @IBOutlet weak var editClassPickerView: UIPickerView!
    
    // loading functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.editClassPickerView.delegate = self
        self.editClassPickerView.dataSource = self
        editClassTableView.reloadData()
        editClassPickerView.selectRow(classP, inComponent: 0, animated: true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editClassPickerView.delegate = self
        self.editClassPickerView.dataSource = self
        editClassTableView.reloadData()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        editClassPickerView.selectRow(classP, inComponent: 0, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //reload from popups
    @objc func loadList(notification: NSNotification){
        //load data here
        editClassTableView.reloadData()
    }
    
    
    // TABLE VIEW FUNCTIONS
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return and sets number of rows
        if(classesArray.count != 0) {
            return classesArray[classP].classList.count
        }
        else {
            return 0
        }
    }
    
    // decides what is in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        var name = classesArray[classP].classList[indexPath.row]
        cell.textLabel?.text = name.firstName + " " + name.lastName
        return(cell)
    }
    
    // function that deletes a row/student
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
            classesArray[classP].classList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
    }
    
    //Edit student popup
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentIndex = indexPath.row
        performSegue(withIdentifier: "editStudentSegue", sender: self)
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
        editClassTableView.reloadData()
    }
    
    
}



