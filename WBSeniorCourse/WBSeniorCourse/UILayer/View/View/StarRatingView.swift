//
//  StarRatingView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 09.08.2024.
//

import SwiftUI

struct StarRatingView: View {
    
    // MARK: - Properties
    
    private let rating: Double
    
    // MARK: - Initialization and deinitialization
    
    init(rating: Double) {
        self.rating = rating
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 2) {
            starImage
            ratingLabel
        }
    }
}

// MARK: - UI Properties

private extension StarRatingView {
    @ViewBuilder
    var starImage: some View {
        Image(uiImage: .Asset.Statistics.starIcon.image)
            .resizable()
            .scaledToFill()
            .frame(width: 20, height: 20)
    }
    
    @ViewBuilder
    var ratingLabel: some View {
        Text("\(rating, specifier: "%.1f")")
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 14, weight: .medium))
    }
}

// MARK: - Stubable

extension StarRatingView: Stubable {
    static func stub() -> any View {
        return ZStack {
            LinearGradient(
                gradient: AppColor.Gradient.darkPurple.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            StarRatingView(rating: 5)
        }
    }
}

// MARK: - Preview

#Preview {
    StarRatingView.stub()
}
