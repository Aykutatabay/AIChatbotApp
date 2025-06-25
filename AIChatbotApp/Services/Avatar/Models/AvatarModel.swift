//
//  AvatarModel.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 25.06.2025.
//

import Foundation

struct AvatarModel {
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

struct AvatarDescriptionBuilder {
    var characterOption: CharacterOption
    var characterAction: CharacterAction
    var characterLocation: CharacterLocation
    
    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }
    
    var characterDescription: String {
        return "a \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)"
    }
}

enum CharacterOption: String {
    case man, woman, alien, dog, cat
    
    static var `default`: Self {
        return .man
    }
}

enum CharacterAction: String {
    case smiling, sitting, eating, drinking, walking, shopping, studying, working, relaxing, fighting, crying
    
    static var `default`: Self {
        return .sitting
    }
}

enum CharacterLocation: String {
    case park, mall, museum, desert, city, forest, space
    
    static var `default`: Self {
        return .city
    }
}
