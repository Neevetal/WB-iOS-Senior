//
//  ImageTitleButton.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 21.07.2024.
//

import SwiftUI

struct ImageTitleButton: View {
    
    // MARK: - Properties
    
    private let text: String
    private let icon: UIImage
    private let action: () -> Void
    
    // MARK: - Initialization and deinitialization
    
    init(
        text: String,
        icon: UIImage,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.icon = icon
        self.action = action
    }
    
    // MARK: - Body
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(uiImage: icon)
                    .frame(width: 20, height: 20)
                Text(text)
                    .font(.montserratFont(size: 14, weight: .medium))
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
            }
            .foregroundColor(AppColor.Text.White.main.color)
        }
    }
}

// MARK: - Stubable

extension ImageTitleButton: Stubable {
    static func stub() -> any View {
        return ImageTitleButton(
            text: AppString.Statistics.share,
            icon: .Asset.Statistics.shareIcon.image
        ) {}
            .padding()
            .background(Color.gray)
    }
}

// MARK: - Preview

#Preview {
    ImageTitleButton.stub()
}

