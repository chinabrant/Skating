//
//  AddCommentViewController.swift
//  Skating
//
//  Created by Brant on 3/18/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class AddCommentViewController: BaseViewController {

    @IBOutlet weak var textView: GCPlaceholderTextView!
    var commentModel = CommentModel()
    var post: PostModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "评论"
        textView.placeholder = "请输入评论内容"
        // Do any additional setup after loading the view.
        var leftItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Bordered, target: self, action: "cancel")
        self.navigationItem.leftBarButtonItem = leftItem
        
        var rightItem = UIBarButtonItem(title: "提交", style: UIBarButtonItemStyle.Bordered, target: self, action: "commit")
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func commit() {
        self.textView.resignFirstResponder()
        if self.textView.text != nil && self.textView.text != "" {
            // 有内容
            self.commentModel.setObject(self.textView.text, forKey: "content")
            self.commentModel.setObject(self.post, forKey: "post")
            self.commentModel.setObject(AVUser.currentUser(), forKey: "user")
            TMAlertView.sharedInstance.showLoadingView()
            self.commentModel.saveInBackgroundWithBlock({ (success, error) -> Void in
                if success {
                    TMAlertView.sharedInstance.showSuccessMsgAutoHide(1, message: "保存成功", dismissBlock: { ()-> Void in
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.dismissViewControllerAnimated(true, completion: nil)
                        })
                    })
                } else {
                    TMAlertView.sharedInstance.showErrorMsgAutoHide(1, message: "保存失败")
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
