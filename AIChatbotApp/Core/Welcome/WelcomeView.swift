//
//  WelcomeView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct WelcomeView: View {
    @State var imageName: String = Constants.randomImage
    @State private var showCreateAccountView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                ctaButtons
                policies
            }
            .sheet(isPresented: $showCreateAccountView) {
                CreateAccountView(title: "Sign In", subtitle: "Connect to an existing account.")
                    .presentationDetents([.medium])
            }
        }
       
    }
    
    private var titleSection: some View {
        VStack {
            Text("AI Chat")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("Aykut Atabay aykutatabay@ outlook.com")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.top, 24)
    }
    
    private var ctaButtons: some View {
        VStack {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
                
            }
            Text("Already have an account? Sign In!")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .anyButton {
                    onSignInPressed()
                }
        }
        .padding(16)
    }
    
    private func onSignInPressed() {
        showCreateAccountView.toggle()
    }
    
    private var policies: some View {
        HStack(spacing: 8) {
            Link(destination: .init(string: Constants.termsOfUseUrl)!) {
                Text("Terms of Service")
            }
            Circle()
                .fill(.accent)
                .frame(width: 4)
            Link(destination: .init(string: Constants.privacyPolicyUrl)!) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
}
