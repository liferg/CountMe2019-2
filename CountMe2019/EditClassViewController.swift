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
    @IBOutlet weak var SelectDateButtonOutlet: UIButton!
    
    // loading functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        let tempClass = ClassroomPersistentData.init(0, "")
        tempClass.restore(fileName: "class")
        let tempStudent = PersistentData.init("", "")
        tempStudent.restore(fileName: "student")
        SelectDateButtonOutlet.setTitle(currentDate, for: .normal)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        /*if(classesArray.count == 0)
         {
         performSegue(withIdentifier: "toEdit", sender: self)
         }
         */
        // Do any additional setup after loading the view.
        
    }
    @objc func loadList(notification: NSNotification){
        //load data here
        SelectDateButtonOutlet.setTitle(currentDate, for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        let tempClass = ClassroomPersistentData.init(0, "")
        tempClass.restore(fileName: "class")
        let tempStudent = PersistentData.init("", "")
        tempStudent.restore(fileName: "student")
        SelectDateButtonOutlet.setTitle(currentDate, for: .normal)
        collection.reloadData()
        /*if(classesArray.count == 0)
         {
         performSegue(withIdentifier: "toEdit", sender: self)
         }
         */
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func SelectDateButton(_ sender: Any) {
        let popOverVc = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "DatePopUp") as! DatePopUpViewController
        self.addChild(popOverVc)
        popOverVc.view.frame = self.view.frame
        self.view.addSubview(popOverVc.view)
        popOverVc.didMove(toParent: self)
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
        let countInt = classesArray[classP].classList[indexPath.row].count
        let countString = String(countInt)
        cell.StudentCountButton.setTitle(countString, for: .normal)
        if (classesArray[classP].classList[indexPath.row].studentParticipation[currentDate] ?? 0 > 0)
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
        return classesArray[row].className
    }
    // what it will do when you select or scroll to a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        classP = row
        collection.reloadData()
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
