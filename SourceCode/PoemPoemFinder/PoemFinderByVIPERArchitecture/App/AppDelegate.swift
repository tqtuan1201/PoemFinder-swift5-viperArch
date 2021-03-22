//
//  AppDelegate.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/22/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let predictionVC = PredictionModuleBuilder.build()
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = predictionVC
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

