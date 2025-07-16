//
//  CategoryListView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 16.07.2025.
//

import SwiftUI

struct CategoryListView: View {
    @Binding var path: [NavigationPathOption]
    @State private var avatars: [AvatarModel] = AvatarModel.mocks
    
    var category: CharacterOption = .alien
    var imageName: String = Constants.randomImage
    
    var body: some View {
        List {
            CategoryCellView(title: category.plural, imageName: imageName, font: .largeTitle, cornerRadius: 0)
                .removeListRowFormatting()
            
            ForEach(avatars, id: \.avatarId) { avatar in
                CustomListCellView(imageName: avatar.profileImageName, title: avatar.name, subtitle: avatar.characterDescription.lowercased())
                    .anyButton(option: .plain, action: {
                        onAvatarPressed(avatar: avatar)
                    })
                    .removeListRowFormatting()
                
            }
        }
        .navigationDestinationForCore(path: $path)
        .ignoresSafeArea()
        .listStyle(.plain)
    }
    
    private func onAvatarPressed(avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarId))
    }
}

#Preview {
    CategoryListView(path: .constant([]))
}
