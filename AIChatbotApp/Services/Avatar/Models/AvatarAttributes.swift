//
//  AvatarAttributes.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 14.07.2025.
//

import SwiftUI

enum CharacterOption: String, CaseIterable, Hashable {
    case man, woman, alien, dog, cat
    
    static var `default`: Self {
        return .man
    }
    
    var plural: String {
        switch self {
        case .man:
            return "Men"
        case .woman:
            return "Women"
        case .alien:
            return "Aliens"
        case .dog:
            return "Dogs"
        case .cat:
            return "Cats"
        }
    }
    
    var startsWithAVowel: Bool {
        switch self {
        case .alien:
            return true
        default:
            return false
        }
    }
}

enum CharacterAction: String, CaseIterable {
    case smiling, sitting, eating, drinking, walking, shopping, studying, working, relaxing, fighting, crying
    
    static var `default`: Self {
        return .sitting
    }
}

enum CharacterLocation: String, CaseIterable {
    case park, mall, museum, desert, city, forest, space
    
    static var `default`: Self {
        return .city
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
        let prefix = characterOption == .alien ? "an" : "a"
        return "\(prefix) \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)"
    }
}
