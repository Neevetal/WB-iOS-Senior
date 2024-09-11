//
//  ContactDetailsTrendView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct ContactDetailsTrendView: View {
    
    // MARK: - Dependencies
    
    @EnvironmentObject private var service: StatisticsService
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            titleLabel
            specialistsList
        }
        .padding(.vertical, 20)
    }
}

// MARK: - UI Properties

private extension ContactDetailsTrendView {
    @ViewBuilder
    var titleLabel: some View {
        Text(AppString.Statistics.TrendMovement.contactDetails)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .medium))
            .padding(.top, 20)
    }
    
    @ViewBuilder
    var specialistsList: some View {
        LazyVStack(spacing: 0) {
            ForEach(service.users, id: \.self) { specialist in
                ContactDetailsTrendRow(specialist: specialist)
                    .padding(.vertical, 4)
            }
        }
        .padding(.top, 4)
    }
}

// MARK: - Stubable

extension ContactDetailsTrendView: Stubable {
    static func stub() -> any View {
        return ZStack {
            LinearGradient(
                gradient: AppColor.Gradient.darkPurple.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            ContactDetailsTrendView()
                .environmentObject(StatisticsService())
        }
    }
}

// MARK: - Preview

#Preview {
    ContactDetailsTrendView.stub()
}
