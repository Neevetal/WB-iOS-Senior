//
//  GradientView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct GradientView<Content>: View where Content: View {
    
    // MARK: - Properties
    
    private let gradient: Gradient
    private let points: (startPoint: UnitPoint, endPoint: UnitPoint)
    private let content: Content
    
    // MARK: - Initialization and deinitialization
    
    init(
        gradient: Gradient,
        points: (UnitPoint, UnitPoint),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.gradient = gradient
        self.points = points
        self.content = content()
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(
                    gradient: gradient,
                    startPoint: points.startPoint,
                    endPoint: points.endPoint
                ))
            content
        }
    }
}

// MARK: - Stubable

extension GradientView: Stubable {
    static func stub() -> any View {
        return GradientView<EmptyView>(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)
        ) {
            EmptyView()
        }
    }
}

// MARK: - Preview

#Preview {
    GradientView<EmptyView>.stub()
}
