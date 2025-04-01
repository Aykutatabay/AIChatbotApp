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
                Color.blue.ignoresSafeArea()
                    .overlay {
                        Text("T A B B A R V İ E W")
                    }
            },
            onboardingView: {
                Color.red.ignoresSafeArea()
                    .overlay {
                        Text("ONBOARDING VIEW")
                    }
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
