//
//  OnboardingIntroView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 22.06.2025.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            AttributedLocalizedText(localizedKey: "onboarding_opening_text", arguments: [])
            // satır arası bosluk baselineOffset
                .baselineOffset(5)
                .frame(maxHeight: .infinity)
            NavigationLink {
                OnboardingColorView()
            } label: {
                Text("Continue")
                    .callToActionButton()
            }
            .padding(20)

        }
    }
}

#Preview {
    OnboardingIntroView()
}
