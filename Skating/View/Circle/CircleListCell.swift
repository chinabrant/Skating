//
//  CircleListCell.swift
//  Skating
//
//  Created by Brant on 3/16/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class CircleListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindCircle(circle: CircleModel) {
        self.titleLabel.text = circle.title
        self.descLabel.text = circle.desc
    }
    
}
