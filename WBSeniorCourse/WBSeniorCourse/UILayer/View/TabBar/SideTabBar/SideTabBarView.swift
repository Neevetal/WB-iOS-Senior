//
//  SideTabBarView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct SideTabBarView: View{
    
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
        BackgroundImageView(
            image: .Asset.Common.Background.purpleBackgroundImage.image,
            color: Color.black
        ) {
            HStack(spacing: 0) {
                tabBar
                    .edgesIgnoringSafeArea(.all)
                StatisticsScreen()
                    .edgesIgnoringSafeArea(.bottom)
                    .edgesIgnoringSafeArea(.horizontal)
            }
        }
        .statusBar(hidden: true)
    }
}

// MARK: - UI Properties

private extension SideTabBarView {
    @ViewBuilder
    private var tabBar: some View {
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
    }
    
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

extension SideTabBarView: Stubable {
    static func stub() -> any View {
        return SideTabBarView()
    }
}

// MARK: - Preview

#Preview {
    SideTabBarView.stub()
}
