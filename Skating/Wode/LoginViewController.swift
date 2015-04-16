//
//  LoginViewController.swift
//  Skating
//
//  Created by 吴述军 on 15/3/18.
//  Copyright (c) 2015年 wusj. All rights reserved.
//

import UIKit

class LoginViewController: UITableViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        
        self.usernameField.layer.borderWidth = 0.5
        self.usernameField.layer.borderColor = UIColor.grayColor().CGColor
        self.usernameField.layer.cornerRadius = 15
        
        self.passwordField.layer.borderWidth = 0.5
        self.passwordField.layer.borderColor = UIColor.grayColor().CGColor
        self.passwordField.layer.cornerRadius = 15

        var leftItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Bordered, target: self, action: "cancel")
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func loginButtonPressed(sender: UIButton) {
        if self.usernameField.text == nil || self.usernameField.text == "" {
            TMAlertView.sharedInstance.showErrorMsgAutoHide(1, message: "请先填写用户名")
            return
        }
        
        if self.passwordField.text == nil || self.passwordField.text == "" {
            TMAlertView.sharedInstance.showErrorMsgAutoHide(1, message: "请先填写密码")
            return
        }
        
        UserModel.logInWithUsernameInBackground(self.usernameField.text, password: self.passwordField.text) { (user, error) -> Void in
            if user != nil {
                TMAlertView.sharedInstance.showSuccessMsgAutoHide(1, message: "登录成功")
            }
        }
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
        return 2
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
