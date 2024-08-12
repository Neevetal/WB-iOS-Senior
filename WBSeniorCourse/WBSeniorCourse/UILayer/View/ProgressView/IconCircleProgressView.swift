//
//  IconCircleProgressView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 11.08.2024.
//

import SwiftUI

struct IconCircleProgressView: View {
    
    // MARK: - Property Wrappers
    
    @Binding private var progress: Double
    
    // MARK: - Properties
    
    private var icon: UIImage
    
    // MARK: - Initialization and deinitialization
    
    init(
        progress: Binding<Double>,
        icon: UIImage
    ) {
        _progress = progress
        self.icon = icon
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            circleProgressView
            iconImage
            
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
                    AppColor.Background.White.main08.color,
                    lineWidth: 6
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AppColor.Background.Purple.main.color,
                    style: StrokeStyle(
                        lineWidth: 6,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(45))
                .animation(.easeOut, value: progress)
        }
    }
    
    @ViewBuilder
    var iconImage: some View {
        Image(uiImage: icon)
            .resizable()
            .scaledToFill()
            .padding(14)
    }
}

// MARK: - Stubable

extension IconCircleProgressView: Stubable {
    static func stub() -> any View {
        return ZStack {
            Color.black.opacity(0.8)
            IconCircleProgressView(
                progress: .constant(0.5),
                icon: .Asset.Statistics.Progress.clicksIcon.image
            )
            .frame(width: 48, height: 48)
        }
    }
}

// MARK: - Preview

#Preview {
    IconCircleProgressView.stub()
}
