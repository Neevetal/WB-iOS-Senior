//
//  TopBarView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 24) {
            statisticsLabel
            Spacer()
            displayingWidgetsButton
            shareButton
        }
        .foregroundColor(.white)
        .padding(.init(top: 32, leading: 30, bottom: 24, trailing: 24))
    }
}

// MARK: - UI Properties

private extension TopBarView {
    @ViewBuilder
    private var statisticsLabel: some View {
        Text(AppString.Statistics.statistics)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 24, weight: .semiBold))
    }
    
    @ViewBuilder
    private var displayingWidgetsButton: some View {
        ImageTitleButton(
            text: AppString.Statistics.displayingWidgets,
            icon: .Asset.Statistics.slidersIcon.image
        ) {}
    }
    
    @ViewBuilder
    private var shareButton: some View {
        ImageTitleButton(
            text: AppString.Statistics.share,
            icon: .Asset.Statistics.shareIcon.image
        ) {}
    }
}

// MARK: - Preview

#Preview {
    TopBarView()
        .background(Color.black)
}
