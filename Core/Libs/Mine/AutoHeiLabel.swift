//
//  AutoHeiLabel.swift
//  TianMiJie
//
//  Created by Brant on 3/4/15.
//  Copyright (c) 2015 tianmitech. All rights reserved.
//

import UIKit

class AutoHeiLabel: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.numberOfLines == 0 {
            if self.preferredMaxLayoutWidth != self.frame.size.width {
                self.preferredMaxLayoutWidth = self.frame.size.width
                self.setNeedsUpdateConstraints()
            }
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        var s = super.intrinsicContentSize()
        if self.numberOfLines == 0 {
            s.height += 1
        }
        
        return s
    }

}
