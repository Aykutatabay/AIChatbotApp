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
    
    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categoriesSection
            }
            .navigationTitle("Explore")
        }
    }
    
    private var categoriesSection: some View {
        Section {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        CategoryCellView(title: category.rawValue.capitalized)
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


