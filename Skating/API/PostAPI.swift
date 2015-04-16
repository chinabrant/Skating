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
    
    func queryPostList(callback: AVArrayResultBlock, circle: CircleModel, page: Int) {
        self.requestState = RequestState.Requesting
        self.query?.limit = self.pageSize
        self.query?.skip = self.pageSize * page
        self.query?.includeKey("user")
        self.query?.whereKey("circle", equalTo: circle)
        self.query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            self.requestState = RequestState.None
            callback(objects, error)
        })
    }
}
