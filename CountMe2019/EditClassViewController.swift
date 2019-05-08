//
//  EditClassViewController.swift
//  CountMe2019
//
//  Created by Uma Parhar on 1/4/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class EditClassViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource
{
    // outlets
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var ClassPicker: UIPickerView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    // loading functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        let tempClass = ClassroomPersistentData.init(0, "")
        tempClass.restore(fileName: "class")
        let tempStudent = PersistentData.init("", "")
        tempStudent.restore(fileName: "student")
        
        //set currentDate
        
        currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        newCurrentDate = stripTime(from: currentDate)
        
        
        dateLabel.text = dateFormatter.string(from: currentDate)
    editSwitch.setOn(false, animated: true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        // Do any additional setup after loading the view.
        
    }
    
    @objc func loadList(notification: NSNotification){
        //load data here
        collection.reloadData()
    }
    
    @IBOutlet weak var editSwitch: UISwitch!
    
    
    
    @IBAction func decrementCount(_ sender: Any) {
    if editSwitch.isOn
        {
            edit = false
        }
    if(!editSwitch.isOn)
    {
    edit = true
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        let tempClass = ClassroomPersistentData.init(0, "")
        tempClass.restore(fileName: "class")
        let tempStudent = PersistentData.init("", "")
        tempStudent.restore(fileName: "student")
        collection.reloadData()
        /*if(classesArray.count == 0)
         {
         performSegue(withIdentifier: "toEdit", sender: self)
         }
         */
        
        // Do any additional setup after loading the view.
        currentDate = Date()
        editSwitch.setOn(false, animated: true)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        dateLabel.text = dateFormatter.string(from: currentDate)
        
        var check: Bool = true
        
        print("working1")
        if(classesArray.count != 0 && classesArray[classP].classList.count != 0)
        {
            print("working123")
            for participation in classesArray[classP].classList[0].studentParticipation
            {
                print("working2")
                if (Calendar.current.isDateInToday(participation.key))
                {
                    print("working3")
                    check = false
                    break
                }
            }
        }
        if(check)
        {
            if(classesArray.count != 0 && classesArray[classP].classList.count != 0)
            {
                    for studentInt in stride(from:0, to: classesArray[classP].classList.count, by:1)
                    {
                        classesArray[classP].classList[studentInt].studentParticipation.updateValue(0, forKey: newCurrentDate)
                        
                    }
                }
        }
    }
    
    @IBAction func SelectDateButton(_ sender: Any) {
        performSegue(withIdentifier: "pickDate", sender: self)
    }
    
    // COLLECTION VIEW FUNCTIONS
    // number of cells displayed
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(classesArray.count != 0) {
            return classesArray[classP].classList.count
        }
        else {
            return 0
        }
        /*performSegue(withIdentifier: "toEdit", sender: self)
         */
    }
    // what is displayed in each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // makes or reuses cells
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell" , for: indexPath) as! CollectionViewCell
        
        // displays student name in cell
        cell.myLabel.text = classesArray[classP].classList[indexPath.row].firstName + " " + classesArray[classP].classList[indexPath.row].lastName
        
        // sends the index to the CollectionViewCell class
        cell.index = indexPath.row
        
        // reset cell
        cell.StudentButton.backgroundColor = nil
        cell.StudentCountButton.setTitle("", for: .normal)
        
        // cell color and count is refreshed
        
        //ISSUE HERE
        print(newCurrentDate)
        print(classesArray[classP].classList[indexPath.row].studentParticipation[newCurrentDate])
        let countInt = classesArray[classP].classList[indexPath.row].studentParticipation[newCurrentDate] ?? 0
        let countString = String(countInt)
        cell.StudentCountButton.setTitle(countString, for: .normal)
        if (classesArray[classP].classList[indexPath.row].studentParticipation[newCurrentDate] ?? 0 > 0)
        {
            cell.StudentButton.backgroundColor = UIColor.gray.withAlphaComponent(0.25)
        }
        return cell
    }
    // tells the delegate that the item at the specified index path was selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
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
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return classesArray[row].className + " - " + String(classesArray[row].classPeriod)
    }
    // what it will do when you select or scroll to a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        classP = row
        collection.reloadData()
        currentDate = Date()
        var check: Bool = true
        
        print("working1")
        if(classesArray.count != 0 && classesArray[classP].classList.count != 0)
        {
            print("working123")
            for participation in classesArray[classP].classList[0].studentParticipation
            {
                print("working2")
                if (Calendar.current.isDateInToday(participation.key))
                {
                    print("working3")
                    check = false
                    break
                }
            }
        }
        if(check)
        {
            if(classesArray.count != 0 && classesArray[classP].classList.count != 0)
            {
                for studentInt in stride(from:0, to: classesArray[classP].classList.count, by:1)
                {
                    classesArray[classP].classList[studentInt].studentParticipation.updateValue(0, forKey: newCurrentDate)
                    
                }
            }
        }
        
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
