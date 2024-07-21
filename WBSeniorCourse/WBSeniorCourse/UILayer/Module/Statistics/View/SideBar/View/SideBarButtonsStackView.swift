//
//  SideBarButtonsStackView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 21.07.2024.
//

import SwiftUI

struct SideBarButtonsStackView: View {
    
    // MARK: - Property Wrappers
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    // MARK: - Properties
    
    private var stackSpacing: CGFloat {
        return horizontalSizeClass == .compact ? 16 : 64
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: stackSpacing) {
            ForEach(Constants.buttonContents, id: \.self) { content in
                Button(action: {}) {
                    Image(uiImage: content)
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 24, height: 24)
            }
        }
    }
}

// MARK: - Nested types

extension SideBarButtonsStackView {
    enum Constants {
        static let buttonContents: [UIImage] = [
            .Asset.Statistics.SideBar.chartsIcon.image,
            .Asset.Statistics.SideBar.chatIcon.image,
            .Asset.Statistics.SideBar.fireIcon.image,
            .Asset.Statistics.SideBar.calendarIcon.image,
            .Asset.Statistics.SideBar.settingsIcon.image
        ]
    }
}

// MARK: - Stubable

extension SideBarButtonsStackView: Stubable {
    static func stub() -> any View {
        return SideBarButtonsStackView()
            .background(Color.black)
    }
}

// MARK: - Preview

#Preview {
    SideBarButtonsStackView.stub()
}
