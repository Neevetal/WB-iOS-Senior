//
//  MarketingSpecialistRow.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 07.08.2024.
//

import SwiftUI

struct MarketingSpecialistRow: View {
    
    // MARK: - Properties
    
    private let specialist: MarketingSpecialist
    
    // MARK: - Initialization and deinitialization
    
    init(specialist: MarketingSpecialist) {
        self.specialist = specialist
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 8) {
                roundImage
                VStack(alignment: .leading, spacing: 0) {
                    nameLabel
                    infoLabel
                }
                Spacer()
                StarRatingView(rating: specialist.rating)
            }
            progressView
            HStack(spacing: 0) {
                salesCompletedLabel
                Spacer()
                completedLabel
            }
            .padding(.top, 10)
            .padding(.bottom, 4)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(AppColor.Background.White.main04.color)
        )
    }
}

// MARK: - UI Properties

private extension MarketingSpecialistRow {
    @ViewBuilder
    private var roundImage: some View {
        RoundImage(
            imageIcon: specialist.image,
            sideSize: 40
        )
    }
    
    @ViewBuilder
    private var nameLabel: some View {
        Text(specialist.name)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
    }
    
    @ViewBuilder
    private var infoLabel: some View {
        Text(
            specialist.grade.rawValue
            + ", "
            + specialist.marketplace.rawValue
        )
        .foregroundColor(AppColor.Text.gray.color)
        .font(.montserratFont(size: 16, weight: .medium))
    }
    
    @ViewBuilder
    private var progressView: some View {
        ProgressView(value: Double(specialist.progress) / 100)
            .tint(AppColor.Background.Purple.main.color)
            .frame(height: 6)
            .padding(.top, 20)
    }
    
    @ViewBuilder
    private var salesCompletedLabel: some View {
        Text(AppString.Statistics.MarketingSpecialists.salesCompleted(
            specialist.completeSalesCount, specialist.needToCompleteSales
        ))
        .foregroundColor(AppColor.Text.White.main.color)
        .font(.montserratFont(size: 12, weight: .regular))
    }
    
    @ViewBuilder
    private var completedLabel: some View {
        Text(AppString.Statistics.MarketingSpecialists.completed(
            specialist.progress
        ))
        .foregroundColor(AppColor.Text.White.main.color)
        .font(.montserratFont(size: 12, weight: .regular))
    }
}

// MARK: - Stubable

extension MarketingSpecialistRow: Stubable {
    static func stub() -> any View {
        return ZStack {
            LinearGradient(
                gradient: AppColor.Gradient.darkPurple.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            MarketingSpecialistRow(
                specialist: MarketingSpecialist.mock()
            )
        }
    }
}

// MARK: - Preview

#Preview {
    MarketingSpecialistRow.stub()
}
