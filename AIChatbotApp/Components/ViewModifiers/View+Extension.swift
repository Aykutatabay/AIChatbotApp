//
//  View+Extension.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

extension View {
    
    func callToActionButton() -> some View {
        self
            .font(.headline).foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .cornerRadius(16)
    }
    
    
    func badgeButton() -> some View  {
        self
            .font(.caption)
            .bold()
            .foregroundStyle(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.blue)
            .cornerRadius(6)
    }
    
    func tappableBackground() -> some View {
        background(Color.black.opacity(0.01))
    }
    
    func removeListRowFormatting() -> some View {
        self
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color.clear)
    }
    
    func addingGradientBackgroundForText() -> some View {
        self
            .background(
                LinearGradient(colors: [.black.opacity(0), .black.opacity(0.3), .black.opacity(0.4)], startPoint: .top, endPoint: .bottom)
            )
    }
    
    func highlightButton(action: @escaping () -> ()) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(HighlightButtonStyle())
    }
    
    func pressableButton(action: @escaping () -> ()) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PressableButtonStyle())
    }
    
    func plainButton(action: @escaping () -> ()) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    @ViewBuilder
    func anyButton(option: ButtonStyleOption = .plain, action: @escaping () -> Void) -> some View {
        switch option {
        case .press:
            pressableButton(action: action)
        case .highlight:
            highlightButton(action: action)
        case .plain:
            plainButton(action: action)
        }
    }
    
}

enum ButtonStyleOption {
    case press, highlight, plain
}
