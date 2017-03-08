//
//  AppDelegate.swift
//  Wetwin
//
//  Created by Kutay Demireren on 28/09/15.
//  Copyright © 2015 Kutay Demireren. All rights reserved.
//

import UIKit
import Parse
import Bolts
import ParseTwitterUtils
import ParseFacebookUtilsV4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("BwAWHZ2yjZd1tXmrkcHvTdFv481jSolGVwMOHs19",
            clientKey: "h3EmBdMw87C8YKXkxO0SKf90qcIc9sbncLCQ1cOV")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        PFTwitterUtils.initializeWithConsumerKey("urqmK3utJMO17WkN51BPkGaSX", consumerSecret: "CcZSHSJMNHa19dIgDze5r9TRf0QZgyqxSKegKhlJMpL4HPDpib")
        //FBSDKSettings.setAppID("1005029782872167")
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        
        
        // Override point or customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Determine the initial view controller here. Which view should the app open with?
        //Check here whether user has logined already or not.
        let openingViewController: UIViewController  = mainStoryboard.instantiateViewControllerWithIdentifier("EntrancePage")
        
        self.window?.rootViewController = openingViewController
        
        self.window?.makeKeyAndVisible()
        
        return true
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

