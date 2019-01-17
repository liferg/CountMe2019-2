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
    var y: String = ""
    @IBAction func StudentButtonAction(_ sender: Any) {
    studentsArray[0].count = studentsArray[0].count + 1
        let x = studentsArray[0].count
        let y = String(x)
        StudentCountButton.setTitle(y, for: .normal)
    }
}
