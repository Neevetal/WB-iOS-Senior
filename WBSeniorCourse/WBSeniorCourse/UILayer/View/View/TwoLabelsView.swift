//
//  TwoLabelsView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 11.08.2024.
//

import SwiftUI

struct TwoLabelsView: View {
    
    // MARK: - Properties
    
    private let titleText: String
    private let commentText: String
    
    // MARK: - Initialization and deinitialization
    
    init(titleText: String, commentText: String) {
        self.titleText = titleText
        self.commentText = commentText
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            titleLabel
            commentLabel
        }
        .padding(12)
        .background(
            AppColor.Background.White.main04.color
                .cornerRadius(16)
        )
    }
}

// MARK: - UI Properties

private extension TwoLabelsView {
    @ViewBuilder
    var titleLabel: some View {
        Text(titleText)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .medium))
    }
    
    var commentLabel: some View {
        Text(commentText)
            .foregroundColor(AppColor.Text.gray.color)
            .font(.montserratFont(size: 12, weight: .regular))
    }
}

// MARK: - Stubable

extension TwoLabelsView: Stubable {
    static func stub() -> any View {
        return ZStack {
            Color.black.opacity(0.8)
            TwoLabelsView(
                titleText: "445 чел.",
                commentText: "Всего с внешнего трафика"
            )
        }
    }
}

// MARK: - Preview

#Preview {
    TwoLabelsView.stub()
}
