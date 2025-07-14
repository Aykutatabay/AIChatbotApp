//
//  ChatRowCellView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 29.06.2025.
//

import SwiftUI

struct ChatRowCellView: View {
    var imageName: String? = Constants.randomImage
    var headline: String? = "Alpha"
    var subheadline: String? = "This is a las message in the chat."
    var hasNewChat: Bool = true
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(.secondary.opacity(0.5))
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(.circle)
            
            VStack(alignment: .leading, spacing: 4) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                }
                
                if let subheadline {
                    Text(subheadline)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            if hasNewChat {
                Text("NEW")
                    .badgeButton()
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color.init(uiColor: .systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        List {
            ChatRowCellView()
                .removeListRowFormatting()
            
            ChatRowCellView()
                .removeListRowFormatting()
            
            ChatRowCellView()
                .removeListRowFormatting()
        }
    }
}
