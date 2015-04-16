//
//  AddPostViewController.swift
//  Skating
//
//  Created by Brant on 4/16/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

class AddPostViewController: BaseViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topView: UIView!
    
    var postModel: PostModel = PostModel()
    var circle: CircleModel!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "发新帖"

        var leftItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Bordered, target: self, action: "cancel")
        self.navigationItem.leftBarButtonItem = leftItem
        
        var rightItem = UIBarButtonItem(title: "提交", style: UIBarButtonItemStyle.Bordered, target: self, action: "commit")
        self.navigationItem.rightBarButtonItem = rightItem
        
        var tap = UITapGestureRecognizer(target: self, action: "addImage")
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        
        var seprator = UIImageView(frame: CGRectMake(0, self.topView.height - 0.5, self.topView.width, 0.5))
        seprator.backgroundColor = UIColor.hexValue("#141414")
        topView.addSubview(seprator)
    }
    
    
    func commit() {
        if titleTextField.text == nil || titleTextField.text == "" {
            return
        }
        
        if contentTextView.text == nil || contentTextView.text == "" {
            return
        }
        
        var pm = AVObject(className: "Post")
        pm.setObject(titleTextField.text, forKey: "title")
        pm.setObject(contentTextView.text, forKey: "content")
        pm.setObject(AVUser.currentUser(), forKey: "user")
        pm.setObject(circle, forKey: "circle")
        pm.setObject(AVFile.fileWithData(UIImagePNGRepresentation(self.image)), forKey: "image")
        pm.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                println("保存成功")
            } else {
                println("保存失败")
            }
        }
    }
    
    func addImage() {
        var actionSheet: UIActionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "相册", destructiveButtonTitle: nil, otherButtonTitles: "相机", "取消")
        actionSheet.cancelButtonIndex = 2
        actionSheet.showFromTabBar(self.tabBarController?.tabBar)
    }
    
    func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UIActionSheetDelegate
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 0 {
            //
            self.pickerSinglePhotoAndEdit()
        } else if buttonIndex == 1 {
            self.takeAPhoto()
        }
    }
    

    // 照相
    func takeAPhoto() {
        var picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.Photo
            picker.delegate = self
            picker.allowsEditing = true
            self.presentViewController(picker, animated: true, completion: nil)
        } else {
            var alert = UIAlertView(title: nil, message: "相机不可用", delegate: nil, cancelButtonTitle: "我知道了")
            alert.show()
        }
    }
    
    // 从相册选择
    func pickerSinglePhotoAndEdit() {
        var picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        self.presentViewController(picker, animated: true) { () -> Void in
            
        }
        
    }
    
    func didSelectPhoto(photo: [NSObject: AnyObject]) {
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        var img: AnyObject? = info[UIImagePickerControllerEditedImage]
        if img != nil {
            self.image = img as? UIImage
            self.imageView.image = img as? UIImage
        }
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}
