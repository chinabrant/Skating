//
//  AppDelegate.swift
//  Skating
//
//  Created by Brant on 3/6/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupAVOS()
        
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        
//        self.window!.backgroundColor = UIColor.whiteColor()
//        var circleList = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CircleListViewController") as CircleListViewController
//        var nav = UINavigationController(rootViewController: circleList)
//        var menu = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MenuViewController") as MenuViewController
//        var sideMenu = SideMenuViewController.sharedInstance
//        sideMenu.setViewControllers(menu, center: nav)
//        
//        self.window?.rootViewController = sideMenu
        
        return true
    }
    
    func setupAVOS() {
        AVOSCloud.setApplicationId("tzpk1b0ugq2my4yspu01awep83yvsjplp3graz7u280flse8", clientKey: "attw7lf4rfv65ccud72k3x93cbuajydphtayiukayxg6f1ox")
        
        CircleModel.registerSubclass()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

