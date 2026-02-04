//
//  AppManager.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import UIKit

final class AppManager {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        // Assigning root view controller
        let manager = SearchManager()
        window.rootViewController = manager.start()
        window.makeKeyAndVisible()
    }
        
}
