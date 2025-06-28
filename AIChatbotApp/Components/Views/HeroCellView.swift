//
//  HeroCellView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 25.06.2025.
//

import SwiftUI

struct HeroCellView: View {
    var title: String? = "Title"
    var subtitle: String? = "Subtitle"
    var imageName: String? = Constants.randomImage
    
    var body: some View {
        ZStack {
            if let imageName {
                ImageLoaderView(urlString: imageName)
            } else {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.accent)
            }
        }
        .overlay(alignment: .bottomLeading, content: {
            VStack(alignment: .leading, spacing: 4) {
                if let title,
                    let subtitle {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(subtitle)
                        .font(.subheadline)
                }
            }
            .foregroundStyle(.white)
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .addingGradientBackgroundForText()
        })
        .cornerRadius(16)
    }
}

#Preview {
    ScrollView {
        VStack {
            HeroCellView()
                .frame(width: 300, height: 200)
            HeroCellView()
                .frame(width: 300, height: 400)
            HeroCellView()
                .frame(width: 200, height: 400)
            HeroCellView()
                .frame(width: 300, height: 200)
            HeroCellView(imageName: nil)
                .frame(width: 300, height: 200)
            HeroCellView(imageName: nil)
                .frame(width: 300, height: 200)
        }
        .frame(maxWidth: .infinity)
    }
    
}
