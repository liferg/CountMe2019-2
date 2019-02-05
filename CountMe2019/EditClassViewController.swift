//
//  EditClassViewController.swift
//  CountMe2019
//
//  Created by Uma Parhar on 1/4/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class EditClassViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if(classesArray.count == 0)
        {
            performSegue(withIdentifier: "toEdit", sender: self)
        }
        
        /*var uma = Student("Uma", "Parhar")
        studentsArray.append(uma)
 */
        /*
        var history = Classroom(1, "history")
        classesArray.append(history)
        
        var science = Classroom(2, "science")
        classesArray.append(science)
         */
        

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(classesArray.count != 0)
        {
            return classesArray[0].classList.count
        }
        else
        {
            performSegue(withIdentifier: "toEdit", sender: self)
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell" , for: indexPath) as! CollectionViewCell
        cell.myLabel.text = classesArray[0].classList[0].firstName + " " + classesArray[0].classList[0].lastName
        
        /*for i in stride(from: 0, to: classesArray.count, by: 1)
        {
        cell.myLabel.text = classesArray[i].className
        }
 */
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
