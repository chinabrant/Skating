//
//  PostListViewController.swift
//  Skating
//
//  Created by Brant on 3/6/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class PostListViewController: BaseViewController {

    @IBOutlet weak var theTableView: UITableView!
    var circle: CircleModel?
    var postAPI: PostAPI = PostAPI()
    var postList = [PostModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = circle?.title

        theTableView.registerNib(UINib(nibName: "PostListCell", bundle: nil), forCellReuseIdentifier: "PostListCell")
        
        
        self.refreshData()
    }
    
    func refreshData() {
        self.postAPI.queryPostList { (objects, error) -> Void in
            if error == nil {
                self.postList += objects as [PostModel]
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.theTableView.reloadData()
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return postList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let Identifier = "PostListCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifier, forIndexPath: indexPath) as PostListCell
        cell.bindPost(self.postList[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var postDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PostDetailViewController") as PostDetailViewController
        postDetail.postModel = self.postList[indexPath.row]
        self.navigationController?.pushViewController(postDetail, animated: true)
    }

}
