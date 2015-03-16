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
    
    var circleList = [CircleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "圈子"
        self.tableView.registerNib(UINib(nibName: "CircleListCell", bundle: nil), forCellReuseIdentifier: "CircleListCell")
        
        self.refreshData()
    }
    
    func refreshData() {
        println("读取圈子列表")
        var query = AVQuery(className: "Circle")
        query.limit = 10
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                println(objects)
                self.circleList += objects as [CircleModel]
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
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifier) as CircleListCell
        var circle = self.circleList[indexPath.row] as CircleModel
        cell.bindCircle(circle)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 64
    }
}
