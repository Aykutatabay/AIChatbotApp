//
//  ImageLoaderView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.06.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    var forceTransitionAnimation: Bool = false
    
    var body: some View {
        // swiftui bugı fill dediğin halde tm olarak 100/200 vermiyor o nedenle overlay ve clipped uyguladık
        Rectangle()
            .opacity(0001)
            .overlay {
                WebImage(url: .init(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
            .ifSatisfiedCondition(forceTransitionAnimation, transform: { content in
                content
                    .drawingGroup()
                // bu modifier bu view ı acılmadan once render eder
            })
        
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
        .anyButton(option: .highlight) {
            
        }
}
