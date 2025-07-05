//
//  CreateAccountView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 6.07.2025.
//

import SwiftUI

struct CreateAccountView: View {
    var title: String = "Create Account"
    var subtitle: String = "Don't lose your data Connect to an SSO provider to save your account."
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.largeTitle)
                Text(subtitle)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            SignInWithAppleButtonView(
                type: .signUp,
                style: .black,
                cornerRadius: 10
            )
            .frame(height: 55)
            .anyButton(option: .press) {
                
            }
            
            Spacer()
        }
        .padding(16)
        .padding(.top, 40)
    }
}

#Preview {
    CreateAccountView()
}
