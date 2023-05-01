//
//  AppDelegate.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 20.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      
        appStart()
        
        return true
    }
    
    func appStart() {
        // Override point for customization after application launch.
        window = .init(frame: UIScreen.main.bounds)
        let rootVC = SplashViewController()
        navigationController = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    
}

