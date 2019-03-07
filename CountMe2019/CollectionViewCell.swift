//
//  CollectionViewCell.swift
//  CountMe2019
//
//  Created by Corinn on 1/10/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var StudentCountButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var StudentButton: UIButton!
    var index : Int!
    @IBAction func StudentButtonAction(_ sender: Any) {
        classesArray[classP].classList[index].count = classesArray[classP].classList[index].count + 1
        let countInt = classesArray[classP].classList[index].count
        let countString = String(countInt)
        self.StudentCountButton.setTitle(countString, for: .normal)
        if (classesArray[classP].classList[index].count > 0)
        {
            self.StudentButton.backgroundColor = UIColor.gray.withAlphaComponent(0.25)
        }
    }
}
