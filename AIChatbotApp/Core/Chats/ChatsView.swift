//
//  ChatsView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct ChatsView: View {
    @State private var chats: [ChatModel] = ChatModel.mocks
    
    var body: some View {
        NavigationStack {
            List(content: {
                ForEach(chats) { chat in
                    Text(chat.id)
                }
            })
                .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatsView()
}
