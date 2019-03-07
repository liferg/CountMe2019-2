//
//  FirstViewController.swift
//  CountMe2019
//
//  Created by SIEVWRIGHT, CORINN on 1/2/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class CountParticipationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var editClassTableView: UITableView!
    @IBOutlet weak var editClassPickerView: UIPickerView!
    
    //loading functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.editClassPickerView.delegate = self
        self.editClassPickerView.dataSource = self
        editClassTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editClassPickerView.delegate = self
        self.editClassPickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
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
    
    // function that deletes a row
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
            classesArray[classP].classList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return classesArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return classesArray[row].className
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        classP = row
        editClassTableView.reloadData()
    }
}



