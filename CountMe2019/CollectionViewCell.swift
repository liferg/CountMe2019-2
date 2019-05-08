//
//  CollectionViewCell.swift
//  CountMe2019
//
//  Created by Corinn on 1/10/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // outlets
    @IBOutlet weak var StudentCountButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var StudentButton: UIButton!
    // stores indexPath variable
    var index : Int!
    
    // when cell is selected
    @IBAction func StudentButtonAction(_ sender: Any) {
        // increments or decrements the count of selected student
        var newCount: Int = 0
        // if edit button is in off position it adds 1 to count
        if(edit) {
            newCount = (classesArray[classP].classList[index].studentParticipation[newCurrentDate]! + 1)
        }
        // if edit button is in on position and the count is not 0 it subtracts 1 to count
        else if(!edit && classesArray[classP].classList[index].studentParticipation[newCurrentDate] != 0){
            newCount = (classesArray[classP].classList[index].studentParticipation[newCurrentDate]! - 1)
        }
        // does nothing to count
        else {
            newCount = (classesArray[classP].classList[index].studentParticipation[newCurrentDate]!)
        }
        // adjust count at date
        classesArray[classP].classList[index].studentParticipation[newCurrentDate] = newCount
        
        // immediately displays the change in count / color
        self.StudentCountButton.setTitle(String(newCount), for: .normal)
        // color
        if (classesArray[classP].classList[index].studentParticipation[newCurrentDate]! > 0)
        {
            self.StudentButton.backgroundColor = UIColor.gray.withAlphaComponent(0.25)
        }
        else {
            self.StudentButton.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        }
    }
}
