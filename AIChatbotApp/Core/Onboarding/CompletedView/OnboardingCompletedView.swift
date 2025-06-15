//
//  OnboardingCompletedView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(AppState.self) private var root
    var body: some View {
        VStack {
            Text("Onboarding Completed")
                .frame(maxHeight: .infinity)
            
            Button {
                onFinishButtonTapped()
            } label: {
                Text("Finish")
                    .callToActionButton()
                    
            }

        }
    }
    
    private func onFinishButtonTapped() {
        root.updateViewState(showTabBarState: true)
    }
}


#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
