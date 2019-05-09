//
//  ClassroomStatsTableViewCell.swift
//  CountMe2019
//
//  Created by Corinn on 3/18/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import UIKit

class ClassroomStatsTableViewCell: UITableViewCell {

    @IBOutlet weak var studentCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
