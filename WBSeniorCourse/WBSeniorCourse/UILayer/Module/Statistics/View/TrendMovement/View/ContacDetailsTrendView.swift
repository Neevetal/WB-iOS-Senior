//
//  ContacDetailsTrendView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct ContacDetailsTrendView: View {
    
    // MARK: - Body
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - UI Properties

private extension ContacDetailsTrendView {
    @ViewBuilder
    var titleLabel: some View {
        Text(AppString.Statistics.TrendMovement.title(2024))
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
            .padding(.top, 36)
    }
}

// MARK: - Preview

#Preview {
    ContacDetailsTrendView()
}
