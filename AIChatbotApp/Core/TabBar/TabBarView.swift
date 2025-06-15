//
//  TabBarView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        NavigationStack {
            TabView {
                ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "eyes")
                }
                
                ChatsView()
                    .tabItem {
                        Label("Chats", systemImage: "bubble.left.and.bubble.right")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
            .navigationBarHidden(true)
            .navigationTitle("Title")
        }
    }
}

#Preview {
    TabBarView()
}
