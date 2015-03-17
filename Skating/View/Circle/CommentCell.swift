//
//  CommentCell.swift
//  Skating
//
//  Created by Brant on 3/17/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contentLabel: AutoHeiLabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentLabel.preferredMaxLayoutWidth = self.contentLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindComment(comment: CommentModel) {
        self.contentLabel.text = comment.content
        self.usernameLabel.text = comment.user?.username
        self.timeLabel.text = comment.getFormatterTime()
        
        comment.user?.avatar?.getDataInBackgroundWithBlock({ (data, error) -> Void in
            if data != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.avatarImageView.image = UIImage(data: data!)
                })
            }
        })
    }
}
