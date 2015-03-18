//
//  CommentAPI.swift
//  Skating
//
//  Created by 吴述军 on 15/3/17.
//  Copyright (c) 2015年 wusj. All rights reserved.
//

import Foundation

class CommentAPI: BaseAPI {
    override init() {
        super.init()
        self.query = AVQuery(className: "Comment")
    }
    
    func queryCommentList(callback: AVArrayResultBlock, post: PostModel) {
        self.requestState = RequestState.Requesting
        self.query?.limit = self.pageSize
        self.query?.includeKey("user")
        self.query?.whereKey("post", equalTo: post)
        self.query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            self.requestState = RequestState.None
            callback(objects, error)
        })
    }
}