//
//  PercentageCircleProgressView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 11.08.2024.
//

import SwiftUI

struct PercentageCircleProgressView: View {
    
    // MARK: - Property Wrappers
    
    @Binding private var progress: Double
    
    // MARK: - Properties
    
    private var circleProgress: Double
    
    // MARK: - Initialization and deinitialization
    
    init(progress: Binding<Double>) {
        _progress = progress
        circleProgress = PercentageCircleProgressView.getCircleProgress(
            from: progress.wrappedValue
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            circleProgressView
            VStack(spacing: 10) {
                percentageLabel
                fromAllPurchasesLabel
            }
        }
    }
}

// MARK: - Private methods

private extension PercentageCircleProgressView {
    static func getCircleProgress(from progress: Double) -> Double {
        var circleProgress: Double
        circleProgress = progress - (progress * 0.25)
        return circleProgress
    }
}

// MARK: - UI Properties

private extension PercentageCircleProgressView {
    @ViewBuilder
    var circleProgressView: some View {
        Circle()
            .trim(from: 0, to: circleProgress)
            .stroke(
                Constants.gradient,
                style: StrokeStyle(lineWidth: 12, lineCap: .round)
            )
            .rotationEffect(.degrees(120))
            .animation(.easeOut, value: circleProgress)
    }
    
    @ViewBuilder
    var percentageLabel: some View {
        Text("\(progress * 100, specifier: "%.0f")%")
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 36, weight: .medium))
    }
    
    var fromAllPurchasesLabel: some View {
        Text(AppString.Statistics.ExternalTraffic.fromAllPurchases)
            .foregroundColor(AppColor.Text.gray.color)
            .font(.montserratFont(size: 14, weight: .regular))
    }
}

// MARK: - Nested types

extension PercentageCircleProgressView {
    enum Constants {
        static var gradient = AngularGradient(
            gradient: AppColor.Gradient.green.gradient,
            center: .center,
            startAngle: .degrees(0),
            endAngle: .degrees(270))
    }
}

// MARK: - Stubable

extension PercentageCircleProgressView: Stubable {
    static func stub() -> any View {
        return ZStack {
            Color.black.opacity(0.8)
            PercentageCircleProgressView(progress: .constant(0.78))
                .frame(width: 200, height: 200)
        }
    }
}

// MARK: - Preview

#Preview {
    PercentageCircleProgressView.stub()
}
