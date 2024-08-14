//
//  ContactDetailsTrendRow.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 12.08.2024.
//

import SwiftUI

struct ContactDetailsTrendRow: View {
    
    // MARK: - Properties
    
    private let specialist: MarketingSpecialist
    
    // MARK: - Initialization and deinitialization
    
    init(specialist: MarketingSpecialist) {
        self.specialist = specialist
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            roundImage
            VStack(alignment: .leading, spacing: 4) {
                nameLabel
                mobileOperatorLabel
            }
            Spacer()
            chevronImage
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(AppColor.Background.White.main04.color)
        )
    }
}

// MARK: - UI Properties

private extension ContactDetailsTrendRow {
    @ViewBuilder
    var roundImage: some View {
        RoundImage(
            imageIcon: specialist.image,
            sideSize: 32
        )
    }
    
    @ViewBuilder
    var nameLabel: some View {
        Text(specialist.name)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 14, weight: .medium))
    }
    
    @ViewBuilder
    var mobileOperatorLabel: some View {
        Text(specialist.mobileOperator.rawValue)
            .foregroundColor(AppColor.Text.gray.color)
            .font(.montserratFont(size: 12, weight: .regular))
    }
    
    @ViewBuilder
    var chevronImage: some View {
        Image(uiImage: .Asset.Common.Chevron.rightIcon.image)
            .frame(width: 20, height: 20)
    }
}

// MARK: - Stubable

extension ContactDetailsTrendRow: Stubable {
    static func stub() -> any View {
        return ZStack {
            LinearGradient(
                gradient: AppColor.Gradient.darkPurple.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            ContactDetailsTrendRow(
                specialist: MarketingSpecialist.mock()
            )
            .frame(width: 280)
        }
    }
}

// MARK: - Preview

#Preview {
    ContactDetailsTrendRow.stub()
}
