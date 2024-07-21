//
//  SideBarView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct SideBarView: View {
    
    // MARK: - Property Wrappers
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    // MARK: - Properties
    
    private var verticalOffset: CGFloat {
        return horizontalSizeClass == .compact ? 16 : 32
    }
    
    private var imageSideSize: CGFloat {
        return horizontalSizeClass == .compact ? 20 : 44
    }
    
    private var buttonSideSize: CGFloat {
        return horizontalSizeClass == .compact ? 24 : 48
    }
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                VStack(spacing: 0) {
                    roundImage
                    Spacer()
                    buttonsStackView
                    Spacer()
                    createNewButton
                }
            }
            .frame(width: horizontalSizeClass == .compact ? 40 : 80)
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
            sideSize: imageSideSize
        )
        .padding(.top, verticalOffset)
    }
    
    @ViewBuilder
    private var buttonsStackView: some View {
        SideBarButtonsStackView()
    }
    
    @ViewBuilder
    private var createNewButton: some View {
        Button(action: {}) {
            Image(
                uiImage: .Asset
                    .Statistics.SideBar
                    .plusCircleIcon.image
            )
            .resizable()
            .scaledToFill()
        }
        .frame(width: buttonSideSize, height: buttonSideSize)
        .padding(.bottom, verticalOffset)
    }
}

// MARK: - Stubable

extension SideBarView: Stubable {
    static func stub() -> any View {
        return HStack(spacing: 0) {
            SideBarView()
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    SideBarView.stub()
}
