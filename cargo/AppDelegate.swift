//
//  AppDelegate.swift
//  cargo
//
//  Created by Huzaifa Ahmed on 7/20/19.
//  Copyright © 2019 Huzaifa Ahmad. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Firebase
import FirebaseAuth
import SmartcarAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window =  UIWindow()
    var smartcarSdk: SmartcarAuth? = nil

//    var smartcar: SmartcarAuth? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyBqMvRbv-30f-jqA3Ycc4-TfwmqTexF1Pg")
        GMSPlacesClient.provideAPIKey("AIzaSyBqMvRbv-30f-jqA3Ycc4-TfwmqTexF1Pg")
        FirebaseApp.configure()
        if Auth.auth().currentUser != nil{
            let storyboard = UIStoryboard(name: "LoggedIn", bundle: nil)
            let mainController = storyboard.instantiateViewController(withIdentifier: "mainTabBar")
            self.window.rootViewController = mainController
        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainController = storyboard.instantiateViewController(withIdentifier: "initialVC")
            self.window.rootViewController = mainController
        }
      
        self.window.makeKeyAndVisible()
        return true
    }
     func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Close the SFSafariViewController
        window.rootViewController?.presentedViewController?.dismiss(animated: true , completion: nil)
        
        // Sends the URL to the current SmartcarAuth object (if any) which will
        // process it and then call the completion handler.
        if let sdk = smartcarSdk {
            let data = sdk.handleCallback(with: url)
            print(data!)
        }
        
        // Your additional URL handling (if any) goes here.
        
        return true
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

