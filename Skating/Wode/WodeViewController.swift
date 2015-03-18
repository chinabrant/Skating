//
//  WodeViewController.swift
//  Skating
//
//  Created by Brant on 3/18/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class WodeViewController: UITableViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        self.view.backgroundColor = Constant.MainBGColor
        
        self.usernameLabel.text = UserModel.currentUser().username
        var item = UIBarButtonItem(title: "xx", style: UIBarButtonItemStyle.Bordered, target: self, action: "login")
        self.navigationItem.rightBarButtonItem = item
        
        var leftItem = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.Bordered, target: self, action: "settings")
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func settings() {
        var settings = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SettingsViewController") as SettingsViewController
        settings.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(settings, animated: true)
    }
    
    func login() {
        var login = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as LoginViewController
        var nav = UINavigationController(rootViewController: login)
        self.presentViewController(nav, animated: true, completion: nil)
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
        return 1
    }
    
}
