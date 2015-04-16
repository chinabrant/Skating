//
//  SideMenuViewController.swift
//  Tianmijie
//
//  Created by Brant on 12/25/14.
//  Copyright (c) 2014 tianmitech. All rights reserved.
//

import UIKit

@objc protocol SideMenuViewControllerDelegate {
    optional func menuDidOpen()
    optional func menuDidClose()
}

class SideMenuViewController: BaseViewController {
    var leftViewController: UIViewController!
    var centerViewController: UIViewController!
    var isLeftMenuOpen: Bool = false
    var animateComplete: Bool!
    
    var delegate: SideMenuViewControllerDelegate!
    var maskView: UIView = UIView(frame: CGRectMake(0, 0, 0, 0))
    

    
    // 单例
    class var sharedInstance : SideMenuViewController {
        struct Static {
            static let instance : SideMenuViewController = SideMenuViewController()
        }
        return Static.instance
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.isLeftMenuOpen = false
        self.animateComplete = true
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "taggleLeftView")
        maskView.userInteractionEnabled = true
        maskView.addGestureRecognizer(tap)
        maskView.backgroundColor = UIColor.clearColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var rightSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(rightSwipe)
        
        var leftSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "leftSwipe:")
        leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(leftSwipe)
        
        
    }
    
    func handleSwipe(swipe: UISwipeGestureRecognizer) {
        
        println("往右滑")
        if !self.isLeftMenuOpen {
            SideMenuViewController.sharedInstance.taggleLeftView()
        }
    }
    
    func leftSwipe(swipe: UISwipeGestureRecognizer) {
        
        println("往左滑")
        if self.isLeftMenuOpen {
            SideMenuViewController.sharedInstance.taggleLeftView()
        }
    }
    
    func setViewControllers(left: UIViewController, center: UIViewController) {
        self.leftViewController = left
        self.centerViewController = center
        self.addChildViewController(self.centerViewController)
        self.addChildViewController(self.leftViewController)
        
        self.view.addSubview(self.centerViewController.view)
        self.view.insertSubview(self.leftViewController.view, atIndex:0)
        self.setCenterViewShadow()
        
        var vw = self.view.viewWithTag(1001)
        if vw != nil {
            self.view.bringSubviewToFront(vw!)
        }
    }
    
    func setCenterViewShadow() {
        self.centerViewController.view.layer.shadowOffset = CGSizeMake(-5, 5)
        self.centerViewController.view.layer.shadowColor = UIColor(red: 0x8f/255.0, green: 0x8f/255.0, blue: 0x8f/255.0, alpha: 1).CGColor
        self.centerViewController.view.layer.shadowOpacity = 1
        self.centerViewController.view.layer.shadowRadius = 10
    }
    
    // 更改centerViewController
    func setCenterController(center: UIViewController) {
        setCenterController(center, needScale: true)
    }
    
    // 更改centerViewController
    func setCenterController(center: UIViewController, needScale: Bool) {
        self.centerViewController.view.removeFromSuperview()
        self.centerViewController.removeFromParentViewController()
        
        self.centerViewController = center
        self.addChildViewController(self.centerViewController)
        self.view.addSubview(self.centerViewController.view)
        
        if needScale {
            self.centerViewController.view.center = CGPointMake(self.view.frame.size.width, self.view.frame.size.height / 2)
            var newTransform =
            CGAffineTransformScale(self.centerViewController.view.transform, 0.5, 0.5);
            self.centerViewController.view.transform = newTransform
            self.isLeftMenuOpen = true
            
            self.maskView.frame = self.centerViewController.view.bounds
            self.centerViewController.view.addSubview(self.maskView)
        } else {
            self.isLeftMenuOpen = false
        }
        
        self.setCenterViewShadow()
        
        var vw = self.view.viewWithTag(1001)
        if vw != nil {
            self.view.bringSubviewToFront(vw!)
        }
    }
    
    // 关闭和打开菜单 一个平移和一个渐隐渐现效果集合
    func taggleLeftView() {
        if isLeftMenuOpen as Bool {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.centerViewController.view.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
                
                var newTransform =
                CGAffineTransformScale(self.centerViewController.view.transform, 2, 2);
                self.centerViewController.view.transform = newTransform
            }, completion: { (completed: Bool) -> Void in
                self.isLeftMenuOpen = false;
                self.maskView.removeFromSuperview()
                if self.delegate != nil {
                    self.delegate.menuDidClose?()
                }
            })
            
            self.maskView.removeFromSuperview()
        } else {
            leftViewController.view.setNeedsDisplay()
            
            self.maskView.frame = self.centerViewController.view.bounds
            self.centerViewController.view.addSubview(self.maskView)
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.centerViewController.view.center = CGPointMake(self.view.frame.size.width + 20, self.view.frame.size.height / 2)
                var newTransform =
                CGAffineTransformScale(self.centerViewController.view.transform, 0.5, 0.5);
                self.centerViewController.view.transform = newTransform
                
                
            }, completion: { (completed: Bool) -> Void in
                self.leftViewController.view.setNeedsDisplay()

                self.isLeftMenuOpen = true;
                
                if self.delegate != nil {
                    self.delegate.menuDidOpen?()
                }
            })
            
        }
        
    }
    
}
