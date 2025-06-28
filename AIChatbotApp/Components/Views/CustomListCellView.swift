//
//  CustomListCellView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 28.06.2025.
//

import SwiftUI

struct CustomListCellView: View {
    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "An alien that is smiling in the park"
    
    var body: some View {
        HStack {
            if let imageName {
                ImageLoaderView(urlString: imageName)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: 60)
                    .cornerRadius(16)
            }
            VStack(alignment: .leading) {
                if let title {
                    Text(title)
                        .font(.headline)
                }
                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .padding(.vertical, 4)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()

        CustomListCellView()    }
}
