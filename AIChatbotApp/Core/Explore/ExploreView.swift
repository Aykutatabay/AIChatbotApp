//
//  ExploreView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct ExploreView: View {
    let avatar: AvatarModel = .mock
    
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks
    
    @State private var path: [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                featuredSection
                categoriesSection
                popularSection
            }
            .navigationTitle("Explore")
            .navigationDestinationForCore(path: $path)
        }
    }
    
    private var popularSection: some View {
        Section {
            ForEach(popularAvatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(option: .highlight) {
                    onAvatarPressed(avatar: avatar)
                }
                .removeListRowFormatting()
            }
            
        } header: {
            Text("Popular")
        }
    }
    
    private func onAvatarPressed(avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarId))
    }
    
    private func onCategoryPressed(_ category: CharacterOption, imageName: String) {
        path.append(.category(category: category, imageName: imageName))
    }
    
    private var categoriesSection: some View {
        Section {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        if let imageName = popularAvatars.first(where: { $0.characterOption == category })?.profileImageName {
                            CategoryCellView(title: category.rawValue.capitalized, imageName: Constants.randomImage)
                                .anyButton {
                                    onCategoryPressed(category, imageName: imageName)
                                }
                        }
                    }
                }
            }
            .frame(height: 150)
            .scrollIndicators(.never)
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .removeListRowFormatting()
        } header: {
            Text("Categories")
        }
    }
    
    private var featuredSection: some View {
        Section {
            ZStack {
                CarouselView(
                    content: { avatar in
                        HeroCellView(
                            title: avatar.name,
                            subtitle: avatar.characterDescription,
                            imageName: avatar.profileImageName
                        )
                        .anyButton(option: .press) {
                            
                        }
                    },
                    data: featuredAvatars)
            }
            .removeListRowFormatting()
        } header: {
            Text("Featured Avatars")
        }
    }
}

#Preview {
    ExploreView()
}


