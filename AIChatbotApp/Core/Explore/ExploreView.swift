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
    
    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categoriesSection
                popularSection
            }
            .navigationTitle("Explore")
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
                        
                    }
                    .removeListRowFormatting()
                
            }
            
        } header: {
            Text("Popular")
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


