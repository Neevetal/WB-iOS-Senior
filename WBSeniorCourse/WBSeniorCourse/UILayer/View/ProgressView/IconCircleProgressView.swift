//
//  IconCircleProgressView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 11.08.2024.
//

import SwiftUI

struct IconCircleProgressView: View {
    
    // MARK: - Properties
    
    @Binding private var progress: Double
    
    // MARK: - Initialization and deinitialization
    
    init(progress: Binding<Double>) {
        _progress = progress
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            circleProgressView
        }
    }
}

// MARK: - UI Properties

private extension IconCircleProgressView {
    @ViewBuilder
    var circleProgressView: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.pink.opacity(0.5),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.pink,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
    
    @ViewBuilder
    var titleLabel: some View {
        Text("\(progress)%")
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .medium))
    }
    
    var commentLabel: some View {
        Text("")
            .foregroundColor(AppColor.Text.gray.color)
            .font(.montserratFont(size: 12, weight: .regular))
    }
}

// MARK: - Stubable

extension IconCircleProgressView: Stubable {
    static func stub() -> any View {
        return ZStack {
            Color.black.opacity(0.8)
            IconCircleProgressView(progress: .constant(50))
        }
    }
}

// MARK: - Preview

#Preview {
    IconCircleProgressView.stub()
}
