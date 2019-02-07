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
       
        classesArray[0].classList[index].count = classesArray[0].classList[index].count + 1
        let countInt = classesArray[0].classList[index].count
        let countString = String(countInt)
        StudentCountButton.setTitle(countString, for: .normal)
        self.StudentButton.backgroundColor = UIColor.gray.withAlphaComponent(0.25)
    }
}
