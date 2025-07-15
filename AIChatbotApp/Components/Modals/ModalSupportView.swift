//
//  ModalSupportView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 16.07.2025.
//

import SwiftUI

struct ModalSupportView<Content: View>: View {
    @Binding var showProfileModal: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            if showProfileModal {
                Color.black.opacity(0.3).ignoresSafeArea()
                    .transition(AnyTransition(.opacity).animation(.smooth))
                    .onTapGesture {
                        showProfileModal.toggle()
                    }
                    .zIndex(1)
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .zIndex(2)
            }
            
        }
        .zIndex(999)
        .animation(.easeInOut, value: showProfileModal)
    }
}

private struct PreviewView: View {
    @State private var showModal: Bool = false
    
    var body: some View {
        Button("Show Modal") {
            showModal.toggle()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            ModalSupportView(showProfileModal: $showModal) {
                Text("Hello, World!")
                    .transition(.slide)
            }
        }
    }
}

extension View {
    func showModal(show: Binding<Bool>, @ViewBuilder content: () -> some View) -> some View {
        self
            .overlay {
                ModalSupportView(showProfileModal: show) {
                    content()
                }
            }
    }
}

#Preview {
    PreviewView()
}
