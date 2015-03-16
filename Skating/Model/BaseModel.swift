//
//  BaseModel.swift
//  Skating
//
//  Created by Brant on 3/16/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import Foundation

class BaseModel: AVObject {
    var query: AVQuery?
    var pageSize: Int = 10
}
