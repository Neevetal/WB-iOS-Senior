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
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                titleLabel
                commentLabel
            }
            Spacer()
        }
        .padding(12)
        .background(AppColor.Background.White.main04.color)
        .frame(minWidth: 146, maxWidth: 180)
        .cornerRadius(16)
    }
}

// MARK: - UI Properties

private extension TwoLabelsView {
    @ViewBuilder
    var titleLabel: some View {
        Text(titleText)
            .multilineTextAlignment(.leading)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .medium))
    }
    
    var commentLabel: some View {
        Text(commentText)
            .multilineTextAlignment(.leading)
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
            .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        }
    }
}

// MARK: - Preview

#Preview {
    TwoLabelsView.stub()
}
