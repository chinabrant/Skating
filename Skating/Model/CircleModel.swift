//
//  CircleModel.swift
//  Skating
//
//  Created by Brant on 3/16/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class CircleModel: BaseModel, AVSubclassing {
    
    var title: String?
    var desc: String?
    
    class func parseClassName() -> String! {
        return "Circle"
    }
    
    
}
