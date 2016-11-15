//
//  DemoPrototypeCell.swift
//  HelloPaises
//
//  Created by Chihau Chau on 15-11-16.
//  Copyright © 2016 Chihau Chau. All rights reserved.
//

import UIKit

class DemoPrototypeCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
