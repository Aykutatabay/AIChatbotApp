//
//  AppState.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

@Observable
class AppState {
    private(set) var showTabBar: Bool {
        didSet {
            UserDefaults.showTabBarView = showTabBar
        }
    }
    
    init(showTabBar: Bool = UserDefaults.showTabBarView) {
        self.showTabBar = showTabBar
    }
    
    func updateViewState(showTabBarState: Bool) {
        showTabBar = showTabBarState
    }
}
