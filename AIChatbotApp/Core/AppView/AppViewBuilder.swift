//
//  AppViewBuilder.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 2.04.2025.
//

import SwiftUI

struct AppViewBuilder<Content: View, OnboardingContent: View>: View {
    var showTabBar: Bool
    
    @ViewBuilder var tabBarView: Content
    @ViewBuilder var onboardingView: OnboardingContent
    
    var body: some View {
        ZStack {
            if !showTabBar {
                tabBarView
                    .transition(.move(edge: .leading))
            } else {
                onboardingView
                    .transition(.move(edge: .trailing))
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

private struct PreviewView: View {
    
    @State private var showTabBar: Bool = false
    
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
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    PreviewView()
}
