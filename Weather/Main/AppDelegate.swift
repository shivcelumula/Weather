//
//  AppDelegate.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Initializing Scene Delegate
        if connectingSceneSession.role == UISceneSession.Role.windowApplication {
                let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
                config.delegateClass = SceneDelegate.self
                return config
            }
        fatalError("Unhandled scene role \(connectingSceneSession.role)")
    }
}
