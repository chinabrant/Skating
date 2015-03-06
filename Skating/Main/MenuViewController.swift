//
//  MenuViewController.swift
//  Skating
//
//  Created by Brant on 3/6/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    var circleList: CircleListViewController?
    var postList: PostListViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 0 {
            if circleList == nil {
                circleList = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CircleListViewController") as? CircleListViewController
            }
            
            var nav = UINavigationController(rootViewController: circleList!)
            self.sideMenuViewController.contentViewController = nav
        } else if indexPath.row == 1 {
            if postList == nil {
                postList = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PostListViewController") as? PostListViewController
            }
            
            var nav = UINavigationController(rootViewController: postList!)
            self.sideMenuViewController.contentViewController = nav
        }
    }
}
