//
//  PostAPI.swift
//  Skating
//
//  Created by Brant on 3/17/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import Foundation

class PostAPI: BaseAPI {
    override init() {
        super.init()
        self.query = AVQuery(className: "Post")
    }
    
    func queryPostList(callback: AVArrayResultBlock) {
        self.requestState = RequestState.Requesting
        self.query?.limit = self.pageSize
        self.query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            self.requestState = RequestState.None
            callback(objects, error)
        })
    }
}
