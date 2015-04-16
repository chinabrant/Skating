//
//  WodeViewController.swift
//  Skating
//
//  Created by Brant on 3/18/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class WodeViewController: UITableViewController {

    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var originY: CGFloat = 0
    
    // 顶部图片下拉放大效果
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        var offsety = scrollView.contentOffset.y
        
        if offsety < -150 {
            scrollView.contentOffset = CGPointMake(0, -150)
            return
        }
        
        if offsety <= 0 {
            if -originY > -offsety {
                // 往上  返回的时候，图片大小缩回去
                var offset = -originY + offsety
                var scale = (-originY + offsety) / topImage.height
                self.topImage.transform = CGAffineTransformScale(topImage.transform, 1 - scale, 1 - scale)
                self.topImage.y = offsety
            } else {
                // 往下拉 下拉的时候，图片放大
                var offset = -offsety + originY
                var scale = (-offsety + originY) / topImage.height
                self.topImage.transform = CGAffineTransformScale(topImage.transform, scale + 1, scale + 1)
                self.topImage.y = offsety
            }
            
            originY = offsety
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        self.view.backgroundColor = Constant.MainBGColor
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.width / 2.0
        self.avatarImageView.layer.borderWidth = 2
        self.avatarImageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.avatarImageView.layer.masksToBounds = true
        
        var tap = UITapGestureRecognizer(target: self, action: "changeAvatar")
        self.avatarImageView.userInteractionEnabled = true
        self.avatarImageView.addGestureRecognizer(tap)
        
        if UserModel.currentUser() != nil {
            self.usernameLabel.text = UserModel.currentUser().username
            UserModel.currentUser().avatar?.getDataInBackgroundWithBlock({ (data, error) -> Void in
                if data != nil {
                    self.avatarImageView.image = UIImage(data: data)
                }
            })
        }
        
        var item = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Bordered, target: self, action: "login")
        self.navigationItem.rightBarButtonItem = item
        
        var leftItem = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.Bordered, target: self, action: "settings")
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func changeAvatar() {
        if UserModel.currentUser() == nil {
            (self.tabBarController as! TabBarViewController).showLoginView()
            return
        }
    }
    
    func settings() {
        var settings = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SettingsViewController") as! SettingsViewController
        settings.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(settings, animated: true)
    }
    
    func login() {
        var login = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        var nav = UINavigationController(rootViewController: login)
        self.presentViewController(nav, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
