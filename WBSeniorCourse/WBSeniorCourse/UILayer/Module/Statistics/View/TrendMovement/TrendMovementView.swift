//
//  TrendMovementView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct TrendMovementView: View {
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                VStack(spacing: 0) {}
            }
            .frame(minWidth: 220, maxWidth: 220)
            .fixedSize(horizontal: true, vertical: false)
            .cornerRadius(44, corners: [.topLeft, .bottomLeft])
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Preview

#Preview {
    HStack(spacing: 0) {
        Spacer()
        TrendMovementView()
    }
}
