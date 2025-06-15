//
//  AppView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 2.04.2025.
//

import SwiftUI

struct AppView: View {
    
    @State var appState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabBarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("AppView - Tabbar") {
    AppView(appState: .init(showTabBar: true))
}

#Preview("AppView - Onboarding") {
    AppView(appState: .init(showTabBar: false))
}
