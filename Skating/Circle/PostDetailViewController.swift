//
//  PostDetailViewController.swift
//  Skating
//
//  Created by Brant on 3/17/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class PostDetailViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var postModel: PostModel?
    var commentAPI: CommentAPI = CommentAPI()
    var commentList = [CommentModel]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        tableView.registerNib(UINib(nibName: "PostDetailCell", bundle: nil), forCellReuseIdentifier: "PostDetailCell")
        
        self.refreshData()
    }
    
    func refreshData() {
        commentAPI.queryCommentList { (objects, error) -> Void in
            if error == nil {
                self.commentList += objects as [CommentModel]
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return self.commentList.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let Identifier = "PostDetailCell"
            var cell = tableView.dequeueReusableCellWithIdentifier(Identifier) as PostDetailCell
            cell.bindPost(self.postModel!)
            
            return cell
        }
        
        let Identifier = "CommentCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifier) as CommentCell
        cell.bindComment(self.commentList[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        return cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
}
