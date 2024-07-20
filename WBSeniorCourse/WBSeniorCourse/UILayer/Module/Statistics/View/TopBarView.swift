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
        Text(AppString.Statistics.displayingWidgets)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 14, weight: .medium))
    }
    
    @ViewBuilder
    private var shareButton: some View {
        Text(AppString.Statistics.share)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 14, weight: .medium))
    }
}

// MARK: - Preview

#Preview {
    TopBarView()
        .background(Color.black)
}
