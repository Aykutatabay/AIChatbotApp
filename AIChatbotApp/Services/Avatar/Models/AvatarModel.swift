//
//  AvatarModel.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 25.06.2025.
//

import Foundation

// NOTE: - Using struct for model because of that structs are Sendable by default
struct AvatarModel: Hashable {
    let avatarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let date: Date?
    
    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        date: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.date = date
    }
    
    var characterDescription: String {
        return AvatarDescriptionBuilder(avatar: self).characterDescription
    }
    
    static var mock: Self = .mocks.first!
    
    static var mocks: [Self] {
        [
            .init(
                avatarId: UUID().uuidString,
                name: "Alpha",
                characterOption: .alien,
                characterAction: .crying,
                characterLocation: .city,
                profileImageName: Constants.randomImage,
                authorId: UUID().uuidString,
                date: .now
            ),
            .init(
                avatarId: UUID().uuidString,
                name: "Beta",
                characterOption: .dog,
                characterAction: .eating,
                characterLocation: .desert,
                profileImageName: Constants.randomImage,
                authorId: UUID().uuidString,
                date: .now
            ),
            .init(
                avatarId: UUID().uuidString,
                name: "Gamma",
                characterOption: .cat,
                characterAction: .fighting,
                characterLocation: .mall,
                profileImageName: Constants.randomImage,
                authorId: UUID().uuidString,
                date: .now
            ),
            .init(
                avatarId: UUID().uuidString,
                name: "Delta",
                characterOption: .woman,
                characterAction: .shopping,
                characterLocation: .space,
                profileImageName: Constants.randomImage,
                authorId: UUID().uuidString,
                date: .now
            )
        ]
    }
}
