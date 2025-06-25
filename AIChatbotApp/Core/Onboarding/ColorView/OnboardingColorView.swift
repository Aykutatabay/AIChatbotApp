//
//  OnboardingColorView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 22.06.2025.
//

import SwiftUI

struct OnboardingColorView: View {
    @State private var selectedColor: Color = .clear
    
    let profileColors: [Color] = [.red, .green, .mint, .blue, .yellow, .orange, .purple, .pink, .indigo]
    
    var body: some View {
        ScrollView {
            colorGrid
            .padding(.horizontal)
        }
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 17) {
            ZStack {
                if selectedColor != .clear {
                    ctaButton
                    .transition(AnyTransition(.move(edge: .bottom)))
                    .padding(20)
                }
            }
            .background(Color(UIColor.systemBackground))
        }
        .animation(.smooth, value: selectedColor)
    }
    
    private var colorGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16, pinnedViews: [.sectionHeaders]) {
            Section(header: Text("Select a Profile Color").font(.headline).frame(maxWidth: .infinity).background(Color.white)) {
                ForEach(profileColors, id: \.self) { index in
                    Circle()
                        .fill(index)
                        .overlay(content: {
                            Circle()
                                .stroke(selectedColor == index ? .accent : .clear, lineWidth: 10)
                        })
                        .onTapGesture {
                            selectedColor = index
                        }
                }
            }
        }
    }
    
    private var ctaButton: some View {
        NavigationLink {
            OnboardingCompletedView(selectedColor: selectedColor)
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingColorView()
    }
    .environment(AppState())
}
