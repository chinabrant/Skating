//
//  CommentModel.swift
//  Skating
//
//  Created by 吴述军 on 15/3/17.
//  Copyright (c) 2015年 wusj. All rights reserved.
//

import Foundation

class CommentModel: BaseModel, AVSubclassing {
    
    var content: String?
    var desc: String?
    var user: UserModel?
    
    class func parseClassName() -> String! {
        return "Comment"
    }
    
    
}