//
//  ButtonViewModifier.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 28.06.2025.
//

import SwiftUI

struct HighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay {
                configuration.isPressed ? Color.accent : Color.accent.opacity(0)
            }
            .animation(.smooth, value: configuration.isPressed)
    }
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

#Preview {
    VStack {
        Text("Hello, World!")
            .padding()
            .frame(maxWidth: .infinity)
            .tappableBackground()
            .anyButton(option: .press, action: {
                
            })
        
        .padding()
        
        Text("Hello, World!")
            .callToActionButton()
            .anyButton(option: .highlight, action: {
                
            })
        
        Text("Hello, World!")
            .callToActionButton()
            .anyButton(option: .plain, action: {
                
            })
        
    }
}
