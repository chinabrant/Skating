//
//  CircleListViewController.swift
//  Skating
//
//  Created by Brant on 3/6/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class CircleListViewController: BaseViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var circleAPI = CircleAPI()
    var circleList = [CircleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "圈子"
        self.tableView.registerNib(UINib(nibName: "CircleListCell", bundle: nil), forCellReuseIdentifier: "CircleListCell")
        
        self.refreshData()
    }
    
    func refreshData() {
        println("读取圈子列表")
        if self.circleAPI.requestState == RequestState.Requesting {
            return
        }
        
        self.circleAPI.queryCircleList { (objects, error) -> Void in
            if error == nil {
                println(objects)
                self.circleList += objects as! [CircleModel]
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            }
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.circleList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Identifier = "CircleListCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifier) as! CircleListCell
        var circle = self.circleList[indexPath.row] as CircleModel
        cell.bindCircle(circle)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 64
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var postList = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PostListViewController") as! PostListViewController
        postList.circle = self.circleList[indexPath.row] as CircleModel
        postList.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(postList, animated: true)
    }
}
