//
//  ChatsView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct ChatsView: View {
    @State private var chats: [ChatModel] = ChatModel.mocks
    
    @State private var path: [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List(content: {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // FIXME: add user id
                        chat: chat) {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        } getMessage: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        }
                        .anyButton(option: .highlight, action: {
                            onChatPressed(chat: chat)
                        })
                        .removeListRowFormatting()
                    }
                }
            )
            .navigationTitle("Chats")
            .navigationDestinationForCore(path: $path)
        }
    }
    
    private func onChatPressed(chat: ChatModel) {
        path.append(.chat(avatarId: chat.avatarId))
    }
}

#Preview {
    ChatsView()
}
