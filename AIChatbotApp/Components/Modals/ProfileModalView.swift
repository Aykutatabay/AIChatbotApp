//
//  ProfileModalView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 16.07.2025.
//

import SwiftUI

struct ProfileModalView: View {
    
    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var headline: String? = "Hello, I am Alpha!"
    var onXMarkPressed: () -> () = { }
    
    var body: some View {
        VStack {
            if let imageName {
                ImageLoaderView(urlString: imageName)
                    .aspectRatio(1, contentMode: .fit)
                
            }
            
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                
                if let headline {
                    Text(headline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.leading, 16)
            .padding(.bottom, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(alignment: .topTrailing, content: {
            Image(systemName: "xmark.circle.fill")
                .font(.title2)
                .foregroundStyle(.black)
                .padding(4)
                .tappableBackground()
                .anyButton(option: .plain, action: {
                    onXMarkPressed()
                })
                .padding(8)
        })
    }
}

#Preview("Modal with image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        ProfileModalView()
            .padding(40)
    }
}

#Preview("Modal without image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        ProfileModalView(imageName: nil)
            .padding(40)
    }
}
