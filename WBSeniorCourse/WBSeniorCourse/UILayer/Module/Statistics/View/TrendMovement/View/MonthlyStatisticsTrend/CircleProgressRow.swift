//
//  CircleProgressRow.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 12.08.2024.
//

import SwiftUI

struct CircleProgressRow: View {
    
    struct Model {
        let icon: UIImage
        let title: String
        let value: String
    }
    
    // MARK: - Property Wrappers
    
    @Binding private var progress: Double
    
    // MARK: - Properties
    
    private let model: Model
    
    // MARK: - Initialization and deinitialization
    
    init(
        progress: Binding<Double>,
        model: Model
    ) {
        _progress = progress
        self.model = model
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 12) {
            circleProgressView
            VStack(alignment: .leading, spacing: 2) {
                titleLabel
                valueLabel
            }
        }
    }
}

// MARK: - UI Properties

private extension CircleProgressRow {
    @ViewBuilder
    var circleProgressView: some View {
        IconCircleProgressView(
            progress: $progress,
            icon: model.icon
        )
        .frame(width: 48, height: 48)
    }
    
    @ViewBuilder
    var titleLabel: some View {
        Text(model.title)
            .foregroundColor(AppColor.Text.gray.color)
            .font(.montserratFont(size: 14, weight: .regular))
    }
    
    @ViewBuilder
    var valueLabel: some View {
        Text(model.value)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
    }
}

// MARK: - Stubable

extension CircleProgressRow: Stubable {
    static func stub() -> any View {
        return ZStack {
            Color.black.opacity(0.8)
            CircleProgressRow(
                progress: .constant(0.5),
                model: .init(
                    icon: .Asset.Statistics.Progress.clicksIcon.image,
                    title: AppString.Statistics.TrendMovement.clicks,
                    value: "24%"
                )
            )
        }
    }
}

// MARK: - Preview

#Preview {
    CircleProgressRow.stub()
}
