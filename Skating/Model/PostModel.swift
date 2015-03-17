//
//  PostModel.swift
//  Skating
//
//  Created by Brant on 3/6/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class PostModel: BaseModel, AVSubclassing {
    var title: String?
    var content: String?
    var circle: CircleModel?
    var image: AVFile?
    var user: UserModel?
    
    class func parseClassName() -> String! {
        return "Post"
    }
    
    
}
