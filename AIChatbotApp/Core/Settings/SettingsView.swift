//
//  SettingsView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(AppState.self) private var appState
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutPressed()
                } label: {
                    Text("Sign Out")
                }

            }
            .navigationTitle("Settings")
        }
    }
    
    func onSignOutPressed() {
        appState.updateViewState(showTabBarState: false)
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
