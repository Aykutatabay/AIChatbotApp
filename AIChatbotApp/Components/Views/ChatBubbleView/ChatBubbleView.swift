//
//  ChatBubbleView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.07.2025.
//

import SwiftUI

struct ChatBubbleView: View {
    var text: String = "sample text"
    var textColor: Color = .primary
    var backgroundColor: Color = .init(uiColor: .systemGray6)
    var showImage: Bool = true
    var imageName: String?
    
    let offset: CGFloat = 14
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if showImage {
                ZStack {
                    if let imageName {
                        ImageLoaderView(urlString: imageName)
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 45, height: 45)
                .clipShape(.circle)
                .offset(y: offset)
            }
            
            Text(text)
                .font(.body)
                .foregroundStyle(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(6)
        }
        .padding(.bottom, showImage ? offset : 0)
    }
}

#Preview {
    ScrollView {
        ChatBubbleView(text: "We help you review your videos, especially the ones taking up the most space. You decide which to delete or compress to free up storage.")
        ChatBubbleView()
        ChatBubbleView(textColor: .white, backgroundColor: .accent, showImage: false, imageName: nil)
        ChatBubbleView(
            text: "We help you review your videos, especially the ones taking up the most space. You decide which to delete or compress to free up storage.",
            textColor: .white, backgroundColor: .accent, showImage: false, imageName: nil)
    }
    .padding()
}
