//
//  ChatMessageModel.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 28.06.2025.
//

import Foundation

struct ChatMessageModel: Codable {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenByCurrentUser(userId: String) -> Bool {
        guard let seenByIds, !seenByIds.isEmpty else {
            return false 
        }
        
        return seenByIds.contains(userId)
    }
    
    static var mock: ChatMessageModel {
        mocks.first!
    }
    
    static var mocks: [ChatMessageModel] {
        [
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_001",
                authorId: "alice123",
                content: "Hey! Nasılsın?",
                seenByIds: ["bob456"],
                dateCreated: Date().addingTimeInterval(-60 * 5) // 5 dakika önce
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_001",
                authorId: "bob456",
                content: "İyiyim, sen?",
                seenByIds: ["alice123"],
                dateCreated: Date().addingTimeInterval(-60 * 4) // 4 dakika önce
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_001",
                authorId: "alice123",
                content: "Bugün toplantımız var mı?",
                seenByIds: [],
                dateCreated: Date().addingTimeInterval(-60 * 3) // 3 dakika önce
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_001",
                authorId: "bob456",
                content: "Evet, 14:00'te başlıyor.",
                seenByIds: ["alice123"],
                dateCreated: Date().addingTimeInterval(-60 * 2) // 2 dakika önce
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_001",
                authorId: "alice123",
                content: "Süper, teşekkürler!",
                seenByIds: [],
                dateCreated: Date().addingTimeInterval(-60 * 1) // 1 dakika önce
            )
        ]
    }
}
