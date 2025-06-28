//
//  ChatRowCellViewBuilder.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 29.06.2025.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    
    var currentUserId: String? = ""
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getMessage: () async -> ChatMessageModel?
    
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    @State private var didLoadAvatar: Bool = false
    @State private var didLoadChatMessage: Bool = false
    
    var body: some View {
        ChatRowCellView(
            imageName: isLoading ? "sasas" : avatar?.profileImageName,
            headline: isLoading ? "sasaa" : avatar?.name,
            subheadline: subheadline,
            hasNewChat: isLoading ? false : hasNewChat
        )
            .redacted(reason: isLoading ? .privacy : .privacy)
            .task {
                await avatar = getAvatar()
                didLoadAvatar = true
            }
            .task {
                await lastChatMessage = getMessage()
                didLoadChatMessage = true
            }
    }
    private var subheadline: String? {
        if isLoading {
            return "sajshjahs"
        }
        
        if avatar == nil && lastChatMessage == nil {
            return "Error"
        }
        
        return lastChatMessage?.content
    }
    
    private var isLoading: Bool {
        !didLoadAvatar && !didLoadChatMessage
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        
        return lastChatMessage.hasBeenSeenByCurrentUser(userId: currentUserId)
    }
}

#Preview {
    VStack {
        ChatRowCellViewBuilder(chat: .mock) {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        } getMessage: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        }
        
        ChatRowCellViewBuilder(chat: .mock) {
             .mock
        } getMessage: {
             .mock
        }
        
        ChatRowCellViewBuilder(chat: .mock) {
            nil
        } getMessage: {
            nil
        }
    }
}
