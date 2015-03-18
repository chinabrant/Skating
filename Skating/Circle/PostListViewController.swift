//
//  PostListViewController.swift
//  Skating
//
//  Created by Brant on 3/6/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class PostListViewController: BaseTableViewController {

    @IBOutlet weak var theTableView: UITableView!
    var circle: CircleModel?
    var postAPI: PostAPI = PostAPI()
//    var postList = [PostModel]()
    var postList = PostList()
    
    
    override func initTableView() {
        self.containLoadMoreView = true
        self.tbview = self.theTableView
        self.dataList = postList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = circle?.title

        theTableView.registerNib(UINib(nibName: "PostListCell", bundle: nil), forCellReuseIdentifier: "PostListCell")
        
        self.theTableView.addPullToRefresh { () -> () in
            self.refreshData()
        }
        
        self.theTableView.startPullToRefresh()
    }
    
    func refreshData() {
        self.postList.isReloading = true
        
        self.postAPI.queryPostList( { (objects, error) -> Void in
            if error == nil {
                self.postList.loadData(objects)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.theTableView.reloadData()
                })
            }
        }, circle: self.circle!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return postList.count()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        return cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let Identifier = "PostListCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifier) as PostListCell
        cell.bindPost(self.postList.list[indexPath.row] as PostModel)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var postDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PostDetailViewController") as PostDetailViewController
        postDetail.postModel = self.postList.list[indexPath.row] as? PostModel
        self.navigationController?.pushViewController(postDetail, animated: true)
    }

}
