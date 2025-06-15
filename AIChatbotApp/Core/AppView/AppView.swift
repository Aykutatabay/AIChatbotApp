//
//  AppView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 2.04.2025.
//

import SwiftUI

struct AppView: View {
    
    @AppStorage("showTabBarView") var showTabBar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabBarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
    }
}

#Preview("AppView - Tabbar") {
    AppView(showTabBar: true)
}

#Preview("AppView - Onboarding") {
    AppView(showTabBar: false)
}
