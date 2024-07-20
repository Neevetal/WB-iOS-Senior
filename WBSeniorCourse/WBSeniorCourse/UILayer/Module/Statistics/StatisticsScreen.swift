//
//  StatisticsScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct StatisticsScreen: View {
    
    // MARK: - Body
    
    var body: some View {
        BackgroundImageView(
            image: .Asset.Common.Background.purpleBackgroundImage.image,
            color: Color.black
        ) {
            HStack(spacing: 0) {
                sideBarView
                VStack(spacing: 0) {
                    topBarView
                    contentView
                }
                .fixedSize(horizontal: false, vertical: false)
                trendMovementView
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

// MARK: - UI Properties

private extension StatisticsScreen {
    @ViewBuilder
    private var sideBarView: some View {
        SideBarView()
    }
    
    @ViewBuilder
    private var topBarView: some View {
        TopBarView()
            .background(Color.green)
    }
    
    @ViewBuilder
    private var contentView: some View {
        ContentStatisticsView()
            .background(Color.blue)
    }
    
    @ViewBuilder
    private var trendMovementView: some View {
        TrendMovementView()
    }
}

// MARK: - Preview

#Preview {
    StatisticsScreen()
}
