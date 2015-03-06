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
    override func viewDidLoad() {
        super.viewDidLoad()

        theTableView.registerNib(UINib(nibName: "PostListCell", bundle: nil), forCellReuseIdentifier: "PostListCell")
    }
    
    func refreshData() {
        var query = AVQuery(className: "Post")
        query.limit = 10
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error != nil {
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Identifier = "PostListCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifier, forIndexPath: indexPath) as PostListCell
        
        
        return cell
    }

}
