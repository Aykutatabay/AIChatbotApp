//
//  WelcomeView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct WelcomeView: View {
    @State var imageName: String = Constants.randomImage
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                ctaButtons
                policies
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
                .onTapGesture {
                    
                }
        }
        .padding(16)
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
