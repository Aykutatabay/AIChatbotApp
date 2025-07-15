//
//  CategoryListView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 16.07.2025.
//

import SwiftUI

struct CategoryListView: View {
    var category: CharacterOption = .alien
    var imageName: String = Constants.randomImage
    @State private var avatars: [AvatarModel] = AvatarModel.mocks
    
    var body: some View {
        List {
            CategoryCellView(title: category.plural, imageName: imageName, font: .largeTitle, cornerRadius: 0)
                .removeListRowFormatting()
            
            ForEach(avatars, id: \.avatarId) { avatar in
                CustomListCellView(imageName: avatar.profileImageName, title: avatar.name, subtitle: avatar.characterDescription.lowercased())
                    .removeListRowFormatting()
            }
        }
        .ignoresSafeArea()
        .listStyle(.plain)
    }
}

#Preview {
    CategoryListView()
}
