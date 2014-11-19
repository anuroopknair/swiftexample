
//
//  AppDelegate.swift
//  swiftexample
//
//  Created by shan2 on 15/10/14.
//  Copyright (c) 2014 Neologix Pvt Ltd. All rights reserved.
//

import Foundation;
import SystemConfiguration;
import MobileCoreServices
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var database:COpaquePointer = nil
    


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
      
            checkdatabase()
    
        
        
        return true
    }
    func checkdatabase(){
        var dirPaths:NSString
        
        dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString;
        
        let databasePath = dirPaths.stringByAppendingString("/MyPasswordManager.sqlite")
        let dbpath = databasePath;// (databasePath as NSString).UTF8String
        NSLog("%@", dbpath);
        
        println("path ",databasePath);
        
          println("path ",dbpath);
        let filemanager = NSFileManager.defaultManager()
        
        
    if (!filemanager.fileExistsAtPath(databasePath))
        {
            let fileForCopy = NSBundle.mainBundle().pathForResource("MyPasswordManager",ofType:"sqlite")
            println("error while opening ",fileForCopy);
            filemanager.copyItemAtPath(fileForCopy!, toPath:databasePath, error: nil)
        }
        
        let error = sqlite3_open(dbpath, &database)
        if error != SQLITE_OK
        {
            println("error while opening");
            //sqlite3_close(database);
        }
        else
        {
            println("already open");
        }
        
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

