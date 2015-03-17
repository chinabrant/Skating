//
//  PostDetailCell.swift
//  Skating
//
//  Created by Brant on 3/17/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class PostDetailCell: UITableViewCell {

    @IBOutlet weak var titleLabel: AutoHeiLabel!
    @IBOutlet weak var contentLabel: AutoHeiLabel!
    @IBOutlet weak var imgView: AutoHeiImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.preferredMaxLayoutWidth = self.titleLabel.frame.size.width
        self.contentLabel.preferredMaxLayoutWidth = self.contentLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindPost(post: PostModel) {
        self.titleLabel.text = post.title
        self.contentLabel.text = post.content
        println(post.image)
        if (post.image?.isDataAvailable != nil) {
            self.imgView.image = UIImage(data: post.image!.getData())
        } else {
            post.image?.getDataInBackgroundWithBlock({ (data, error) -> Void in
                if data != nil {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.imgView.image = UIImage(data: data!)
                        self.setNeedsLayout()
                    })
                    
                }
            })
        }
        
    }
}