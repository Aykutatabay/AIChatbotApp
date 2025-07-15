//
//  ChatView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 14.07.2025.
//

import SwiftUI

struct ChatView: View {
    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var avatar: AvatarModel? = AvatarModel.mock
    @State private var currentUser: UserModel? = .mock
    @State private var textfieldText: String = ""
    @State private var showOptionMenu: AnyAppAlert?
    @State private var scrollPosition: String?
    @State private var showAlert: AnyAppAlert?
    
    var body: some View {
        VStack(spacing: 0) {
            scrollSection
            textfieldSection
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .foregroundStyle(.accent)
                    .padding(8)
                    .anyButton(option: .plain) {
                        onChatSettingsPressed()
                    }
            }
        }
        .showCustomAlert(type: .confirmationDialog, alert: $showOptionMenu)
        .showCustomAlert(type: .alert, alert: $showAlert)
    }
    
    private var scrollSection: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser?.userId
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentUser,
                        imageName: avatar?.profileImageName
                    )
                    .id(message.id)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
            .rotationEffect(.degrees(180))
        }
        .rotationEffect(.degrees(180))
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.bouncy, value: chatMessages.count)
        .animation(.bouncy, value: scrollPosition)
    }
    
    private var textfieldSection: some View {
        TextField("Say something....", text: $textfieldText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 60)
            .overlay(alignment: .trailing, content: {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.accent)
                    .padding(.trailing, 4)
                    .anyButton(option: .plain) {
                        onSendMessageTapped()
                    }
            })
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(uiColor: .systemBackground))
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.init(uiColor: .secondarySystemBackground))
    }
    
    private func onSendMessageTapped() {
        guard let currentUser = currentUser else { return }
        do {
            try TextValidationHelper.checkIfMessageIsValid(text: textfieldText)
            
            let message = ChatMessageModel(id: UUID().uuidString, chatId: UUID().uuidString, authorId: currentUser.userId, content: textfieldText, seenByIds: nil, dateCreated: .now)
            chatMessages.append(message)
            textfieldText = ""
            scrollPosition = message.id
        } catch let error {
            showAlert = AnyAppAlert(error: error)
        }
    }
    
    private func onChatSettingsPressed() {
        showOptionMenu = .init(title: "", subtitle: "What would you like to do?", buttons: {
            AnyView(
                Group {
                    Button("Report User / Chat", role: .destructive) {
                        
                    }
                    
                    Button("Delete Chat", role: .destructive) {
                        
                    }
                }
            )
        })
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
