//
//  UserModel.swift
//  Skating
//
//  Created by 吴述军 on 15/3/17.
//  Copyright (c) 2015年 wusj. All rights reserved.
//

import Foundation

class UserModel: AVUser, AVSubclassing {
    
    var avatar: AVFile?
    
    class func parseClassName() -> String! {
        return "_User"
    }
    
    
}