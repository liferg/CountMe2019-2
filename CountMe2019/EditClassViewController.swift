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
    
    // loading functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        collection.reloadData()
        /*if(classesArray.count == 0)
         {
         performSegue(withIdentifier: "toEdit", sender: self)
         }
         */
        
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.ClassPicker.delegate = self
        self.ClassPicker.dataSource = self
        collection.reloadData()
        /*if(classesArray.count == 0)
         {
         performSegue(withIdentifier: "toEdit", sender: self)
         }
         */
        
        // Do any additional setup after loading the view.
        
    }

    // PICKER VIEW FUNCTIONS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return classesArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return classesArray[row].className
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        classP = row
        collection.reloadData()
    }
    
    // COLLECTION VIEW FUNCTIONS
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
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell" , for: indexPath) as! CollectionViewCell
        cell.myLabel.text = classesArray[classP].classList[indexPath.row].firstName + " " + classesArray[classP].classList[indexPath.row].lastName
        cell.index = indexPath.row
        
        // reset
        cell.StudentButton.backgroundColor = nil
        cell.StudentCountButton.setTitle("", for: .normal)
        
        // color and count in top right corner check
        let countInt = classesArray[classP].classList[indexPath.row].count
        let countString = String(countInt)
        cell.StudentCountButton.setTitle(countString, for: .normal)
        if (classesArray[classP].classList[indexPath.row].count > 0)
        {
            cell.StudentButton.backgroundColor = UIColor.gray.withAlphaComponent(0.25)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
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
