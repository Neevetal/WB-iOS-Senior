//
//  SideBarButtonsStackView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 21.07.2024.
//

import SwiftUI

struct SideBarButtonsStackView: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(Constants.buttonContents, id: \.self) { content in
                Button(action: {}) {
                    Image(uiImage: content)
                }
                .frame(width: 48, height: 48)
            }
        }
    }
}

// MARK: - Nested types

extension SideBarButtonsStackView {
    enum Constants {
        static let buttonContents: [UIImage] = [
            .Asset.Statistics.SideBar.chatIcon.image,
            .Asset.Statistics.SideBar.fireIcon.image,
            .Asset.Statistics.SideBar.calendarIcon.image,
            .Asset.Statistics.SideBar.settingsIcon.image
        ]
    }
}

// MARK: - Preview

#Preview {
    SideBarButtonsStackView()
        .background(Color.black)
}
