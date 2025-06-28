//
//  ChatModel.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 28.06.2025.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date
    
    static var mock: ChatModel {
        mocks.first!
    }
    
    static var mocks: [ChatModel] {
        [
            ChatModel(
                id: UUID().uuidString,
                userId: "alice123",
                avatarId: "avatar_female_1",
                dateCreated: Date().addingTimeInterval(-3600 * 24 * 1), // 1 gün önce
                dateModified: Date().addingTimeInterval(-3600 * 1)      // 1 saat önce
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "bob456",
                avatarId: "avatar_male_1",
                dateCreated: Date().addingTimeInterval(-3600 * 24 * 2), // 2 gün önce
                dateModified: Date().addingTimeInterval(-3600 * 2)      // 2 saat önce
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "carol789",
                avatarId: "avatar_female_2",
                dateCreated: Date().addingTimeInterval(-3600 * 24 * 3), // 3 gün önce
                dateModified: Date().addingTimeInterval(-3600 * 3)      // 3 saat önce
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "dave321",
                avatarId: "avatar_male_2",
                dateCreated: Date().addingTimeInterval(-3600 * 24 * 4), // 4 gün önce
                dateModified: Date().addingTimeInterval(-3600 * 4)      // 4 saat önce
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "eve654",
                avatarId: "avatar_female_3",
                dateCreated: Date().addingTimeInterval(-3600 * 24 * 5), // 5 gün önce
                dateModified: Date().addingTimeInterval(-3600 * 5)      // 5 saat önce
            )
        ]
    }
}
