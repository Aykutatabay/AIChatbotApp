//
//  AppViewBuilder.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 2.04.2025.
//

import SwiftUI

struct AppViewBuilder<Content: View>: View {
    var showTabBar: Bool
    
    @ViewBuilder var tabBarView: Content
    @ViewBuilder var onboardingView: Content
    
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
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}


#Preview {
    PreviewView()
}
