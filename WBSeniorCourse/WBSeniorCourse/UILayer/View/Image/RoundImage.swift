//
//  RoundImage.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct RoundImage: View {
    
    // MARK: - Properties
    
    private let imageIcon: UIImage!
    private let sideSize: CGFloat
    
    // MARK: - Initialization and deinitialization
    
    init(imageIcon: UIImage? = nil, sideSize: CGFloat) {
        self.imageIcon = imageIcon
        self.sideSize = sideSize
    }
    
    // MARK: - Body
    
    var body: some View {
        Image(
            uiImage: imageIcon == nil
            ? .Asset.Common.noPhotoIcon.image
            : imageIcon
        )
        .resizable()
        .scaledToFill()
        .clipShape(Circle())
        .frame(width: sideSize, height: sideSize)
        
    }
}

// MARK: - Stubable

extension RoundImage: Stubable {
    static func stub() -> any View {
        return RoundImage(
            imageIcon: .Asset.Authorization.profileIcon.image,
            sideSize: 96
        )
    }
}

// MARK: - Preview

#Preview {
    RoundImage.stub()
}
