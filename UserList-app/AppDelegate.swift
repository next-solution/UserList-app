//
//  AppDelegate.swift
//  UserList-app
//
//  Created by Marcin Makurat on 17/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        openMainViewController()
        
        return true
    }
    
    func openMainViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let navcontroller = UINavigationController(rootViewController: UserListViewController())
        window?.rootViewController = navcontroller
        window?.makeKeyAndVisible()
    }

}

