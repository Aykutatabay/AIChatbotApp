//
//  ProfileView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettingsView: Bool = false
    @State private var isLoading: Bool = true
    @State private var showCreateAvatarsView: Bool = false
    @State private var currentUser: UserModel? = .mock
    @State private var myAvatars: [AvatarModel] = []
    
    var body: some View {
        NavigationStack {
            List {
                myInfoSection
                myAvatarsSection
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingsButton
                }
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
            .fullScreenCover(isPresented: $showCreateAvatarsView) {
                CreateAvatarView()
            }
        }
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        try? await Task.sleep(for: .seconds(5))
        isLoading.toggle()
        myAvatars = AvatarModel.mocks
    }
    
    private var myAvatarsSection: some View {
        Section {
            if myAvatars.isEmpty {
                Group {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("click plus to add avatar")
                    }
                }
                .padding(50)
                .frame(maxWidth: .infinity)
                .font(.body)
                .foregroundStyle(.secondary)
                .removeListRowFormatting()
            } else {
                ForEach(myAvatars, id: \.self) { avatar in
                    CustomListCellView(imageName: avatar.profileImageName, title: avatar.name, subtitle: nil)
                        .anyButton(option: .highlight, action: {
                            
                        })
                        .removeListRowFormatting()
                }
                .onDelete { indexSet in
                    onDeleteAvatar(index: indexSet)
                }
            }
            
            
        } header: {
            HStack(spacing: 0) {
                Text("My Avatars")
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundStyle(.accent)
                    .anyButton {
                        onNewAvatarButtonPressed()
                        
                    }
            }
        }
    }
    
    private var myInfoSection: some View {
        Section {
            ZStack {
                Circle()
                    .fill(currentUser?.profileColor ?? .accent)
            }
            .frame(width: 100, height: 100)
            .frame(maxWidth: .infinity)
            .removeListRowFormatting()
        }
    }
    
    private var settingsButton: some View {
        Image(systemName: "gear")
            .font(.headline)
            .foregroundStyle(.accent)
            .anyButton {
                onSettingsButtonPressed()
            }
    }
    
    private func onSettingsButtonPressed() {
        showSettingsView.toggle()
    }
    
    private func onNewAvatarButtonPressed() {
        showCreateAvatarsView.toggle()
    }
    
    private func onDeleteAvatar(index: IndexSet) {
        guard let index = index.first else { return }
        myAvatars.remove(at: index)
    }
    
}

#Preview {
    ProfileView()
        .environment(AppState())
}
