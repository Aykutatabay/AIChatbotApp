//
//  NavigationPathOption.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 17.07.2025.
//

import SwiftUI

enum NavigationPathOption: Hashable {
    case chat(avatarId: String)
    case category(category: CharacterOption, imageName: String)
}

