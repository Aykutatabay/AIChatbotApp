//
//  ProfileView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettingsView: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Profile")
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingsButton
                }
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
        }
    }
    
    private var settingsButton: some View {
        Button(action: {
            onSettingsButtonPressed()
            
        }, label: {
            Image(systemName: "gear")
                .font(.headline)
        })
    }
    
    private func onSettingsButtonPressed() {
        showSettingsView.toggle()
    }
}

#Preview {
    ProfileView()
}
