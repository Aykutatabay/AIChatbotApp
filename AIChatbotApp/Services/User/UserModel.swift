//
//  UserModel.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 5.07.2025.
//

import SwiftUI

struct UserModel {
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?
    
    init(
        userId: String,
        dateCreated: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }
    
    var profileColor: Color {
        guard let profileColorHex else {
            return .accent
        }
        return Color(hex: profileColorHex) ?? .accent
    }
    
    static var mock: Self = mocks.first!
    
    static var mocks: [UserModel] {
        let now = Date()
        return [
            UserModel(
                userId: "user_001",
                dateCreated: now.addingTimeInterval(-60 * 60 * 24 * 7), // 1 hafta önce
                didCompleteOnboarding: true,
                profileColorHex: "#33FF57"
            ),
            UserModel(
                userId: "user_002",
                dateCreated: now.addingTimeInterval(-60 * 60 * 24 * 2), // 2 gün önce
                didCompleteOnboarding: false,
                profileColorHex: "#33FF57"
            ),
            UserModel(
                userId: "user_003",
                dateCreated: now,
                didCompleteOnboarding: nil,
                profileColorHex: "#33FF57"
            )
        ]
    }
}
