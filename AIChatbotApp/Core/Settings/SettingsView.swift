//
//  SettingsView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(AppState.self) private var appState
    @Environment(\.presentationMode) var presentationMode
    
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
        presentationMode.wrappedValue.dismiss()
        Task {
            try? await Task.sleep(for: .seconds(0.3))
            self.appState.updateViewState(showTabBarState: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
