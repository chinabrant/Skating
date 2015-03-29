//
//  PostListCell.swift
//  Skating
//
//  Created by Brant on 3/6/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class PostListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: AutoHeiLabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.preferredMaxLayoutWidth = self.titleLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindPost(post: PostModel) {
        self.titleLabel.text = post.title
        self.timeLabel.text = post.user!.username + " " + post.getFormatterTime()
        self.userLabel.text = "\(post.commentCount!)" + "回复"
    }
    
}
