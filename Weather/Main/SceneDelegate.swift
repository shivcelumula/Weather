//
//  SceneDelegate.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appManager: AppManager?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let manager = AppManager(window: window)
        self.appManager = manager
        manager.start()
    }
}
