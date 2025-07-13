//
//  AsyncCallToActionButton.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 14.07.2025.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    var title: String = "Save"
    var isLoading: Bool = false
    var action: () -> ()
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView()
                    .tint(.white)
            } else {
                Text(title)
            }
        }
        .callToActionButton()
        .anyButton(option: .press) {
            action()
        }
        .disabled(isLoading)
        .padding(20)
        
    }
}

#Preview {
    AsyncCallToActionButton(title: "Save", isLoading: true, action: {
        
    })
}
