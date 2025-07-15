//
//  TextValidationHelper.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.07.2025.
//

import SwiftUI



struct TextValidationHelper {
    static func checkIfMessageIsValid(text: String) throws {
        let minCharCount: Int = 3
        guard text.count >= minCharCount else {
            throw TextValidationError.notEnoughCharacters(min: minCharCount)
        }
        let badWords: [String] = [
            "shit",
            "bitch",
            "ass"
        ]
        
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.badWords
        }
    }
    
    enum TextValidationError: LocalizedError {
        case notEnoughCharacters(min: Int)
        case badWords
        
        var errorDescription: String? {
            switch self {
            case .notEnoughCharacters(let min):
                return "Please add at least \(min) characters"
            case .badWords:
                return "Bad word detected. Please rephrase your message."
            }
        }
    }
}
