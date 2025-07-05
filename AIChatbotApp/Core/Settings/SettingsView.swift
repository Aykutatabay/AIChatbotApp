//
//  SettingsView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

fileprivate extension View {
    func rowFormatting() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            .background(content: {
                Color(uiColor: .systemBackground)
            })
    }
}

struct SettingsView: View {
    
    @Environment(AppState.self) private var appState
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isPremium: Bool = false
    @State private var isAnonymousUser: Bool = false
    @State private var showCreateAccountView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                accountSection
                purchaseSection
                appSection
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showCreateAccountView) {
                CreateAccountView()
                    .presentationDetents([.medium])
            }
        }
    }
    
    private var accountSection: some View {
        Section {
            if !isAnonymousUser {
                Text("Save & back-up account")
                    .rowFormatting()
                    .anyButton {
                        onCreateAccountPressed()
                    }
                    .removeListRowFormatting()
            } else {
                Text("Sign Out")
                    .rowFormatting()
                    .anyButton {
                        onSignOutPressed()
                    }
                    .removeListRowFormatting()
            }
            
            Text("Delete Account")
                .foregroundStyle(.red)
                .rowFormatting()
                .anyButton {
                    onSignOutPressed()
                }
                .removeListRowFormatting()
        } header: {
            Text("Account")
        }
    }
    
    private var purchaseSection: some View {
        Section {
            HStack {
                Text("Account status: \(isPremium ? "Premium" : "Free")")
                Spacer()
                if isPremium {
                    Text("MANAGE")
                        .badgeButton()
                }
            }
            .rowFormatting()
            .anyButton(option: .highlight) {
                onSignOutPressed()
            }
            .removeListRowFormatting()
        } header: {
            Text("Purchases")
        }
    }
    
    private var appSection: some View {
        Section {
            HStack {
                Text("Version")
                Spacer()
                Text(Utilities.appVersion ?? "1.0")
            }
            .rowFormatting()
            .removeListRowFormatting()
            
            HStack {
                Text("Build Number")
                Spacer()
                Text(Utilities.buildNumber ?? "")
            }
            .rowFormatting()
            .removeListRowFormatting()
            
            HStack {
                Text("Contact Us")
                    .foregroundStyle(.blue)
            }
            .rowFormatting()
            .anyButton(option: .highlight, action: {
                
            })
            .removeListRowFormatting()
        } header: {
            Text("Application")
        } footer: {
            Text("Created by Aykut Atabay.")
        }
    }
    
    func onSignOutPressed() {
        presentationMode.wrappedValue.dismiss()
        Task {
            try? await Task.sleep(for: .seconds(0.3))
            self.appState.updateViewState(showTabBarState: false)
        }
    }
    
    func onCreateAccountPressed() {
        showCreateAccountView.toggle()
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
