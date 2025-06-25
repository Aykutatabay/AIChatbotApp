//
//  OnboardingCompletedView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(AppState.self) private var root
    
    @State private var isCompletingProfileSetup: Bool = false
    
    var selectedColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup Completed")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            
            Text("We've set up your profile and you are ready to start chatting.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
            
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            Button {
                onFinishButtonTapped()
            } label: {
                Group {
                    if isCompletingProfileSetup {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Finish")
                    }
                }
                .callToActionButton()
            }
            .disabled(isCompletingProfileSetup)
            .padding(20)
        }
    }
    
    private func onFinishButtonTapped() {
        isCompletingProfileSetup = true
        Task {
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            root.updateViewState(showTabBarState: true)
        }
        
    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(AppState())
}
