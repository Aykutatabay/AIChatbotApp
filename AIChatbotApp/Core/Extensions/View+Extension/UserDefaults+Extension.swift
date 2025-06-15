//
//  UserDefaults+Extension.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import Foundation

extension UserDefaults {
    
    private struct Keys {
        static let showTabBarView = "showTabBarView"
    }
    
    static var showTabBarView: Bool {
        get {
            standard.bool(forKey: Keys.showTabBarView)
        }
        set {
            standard.set(newValue, forKey: Keys.showTabBarView)
        }
    }
}
