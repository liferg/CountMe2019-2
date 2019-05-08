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
        // increments the count of selected student
        
        // immediately displays the change in count / color
        var x: Int = 0
        if(edit)
        {
            x = (classesArray[classP].classList[index].studentParticipation[newCurrentDate]! + 1)
        }
        else
        {
            x = (classesArray[classP].classList[index].studentParticipation[newCurrentDate]! - 1)
        }
        classesArray[classP].classList[index].studentParticipation[newCurrentDate] = x
        self.StudentCountButton.setTitle(String(x), for: .normal)
        if (classesArray[classP].classList[index].studentParticipation[newCurrentDate]! > 0)
        {
            self.StudentButton.backgroundColor = UIColor.gray.withAlphaComponent(0.25)
        }
    }
}
