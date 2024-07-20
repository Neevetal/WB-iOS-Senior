//
//  SideBarView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct SideBarView: View {
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                VStack(spacing: 0) {
                    roundImage
                    Spacer()
                }
            }
            .frame(minWidth: 80 , maxWidth: 80)
            .fixedSize(horizontal: true, vertical: false)
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - UI Properties

private extension SideBarView {
    @ViewBuilder
    private var roundImage: some View {
        RoundImage(
            imageIcon: .Asset.Authorization.profileIcon.image,
            sideSize: 44
        )
        .padding(.top, 32)
    }
}

// MARK: - Preview

#Preview {
    SideBarView()
}
