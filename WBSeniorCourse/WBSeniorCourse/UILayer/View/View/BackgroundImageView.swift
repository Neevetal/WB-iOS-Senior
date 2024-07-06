//
//  BackgroundImageView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.07.2024.
//

import SwiftUI

struct BackgroundImageView<Content>: View where Content: View {
    
    // MARK: - Properties
    
    private let image: UIImage
    private let color: Color
    private let content: Content
    
    // MARK: - Initialization and deinitialization
    
    init(
        image: UIImage,
        color: Color,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.image = image
        self.color = color
        self.content = content()
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack() {
            color
                .edgesIgnoringSafeArea(.all)
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            content
        }
    }
}

// MARK: - Preview

#Preview {
    BackgroundImageView<EmptyView>(
        image: .Asset.Common.Background.purpleBackgroundImage.image,
        color: Color.black
    ) {
        EmptyView()
    }
}
