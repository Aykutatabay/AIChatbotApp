//
//  WelcomeView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            Text("Welcome!")
                .frame(maxHeight: .infinity)
            
            NavigationLink {
                OnboardingCompletedView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }

            
        }
        .padding(16)
    }
}

#Preview {
    WelcomeView()
}
