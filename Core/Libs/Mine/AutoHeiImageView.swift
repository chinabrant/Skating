//
//  AutoHeiImageView.swift
//  TianMiJie
//
//  Created by 吴述军 on 15/2/10.
//  Copyright (c) 2015年 tianmitech. All rights reserved.
//

import UIKit

class AutoHeiImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
//    - (CGSize)intrinsicContentSize {
//    
//    CGSize s =[super intrinsicContentSize];
//    
//    s.height = self.frame.size.width / self.image.size.width  * self.image.size.height;
//    
//    return s;
//    
//    }
    
    override func intrinsicContentSize() -> CGSize {
        var s = super.intrinsicContentSize()
        if self.image != nil {
            s.height = self.bounds.size.width / self.image!.size.width * self.image!.size.height
        }
        
        return s
    }

}
