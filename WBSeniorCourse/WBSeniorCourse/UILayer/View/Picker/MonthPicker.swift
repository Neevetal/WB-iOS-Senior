//
//  MonthPicker.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 11.08.2024.
//

import SwiftUI

struct MonthPicker: View {
    
    // MARK: - Property Wrappers
    
    @Binding private var selectedMonth: MonthItem
    @Binding private var selectedIndex: Int
    
    // MARK: - Initialization and deinitialization
    
    init(item: Binding<MonthItem>, selectedIndex: Binding<Int> = .constant(0)) {
        _selectedMonth = item
        _selectedIndex = selectedIndex
    }
    
    // MARK: - Body
    
    var body: some View {
        Menu {
            Picker(selection: $selectedMonth) {
                ForEach(FormattedManager.generateMonths()) { month in
                    Text(month.name)
                        .tag(month)
                }
            } label: {}
        } label: {
            HStack(spacing: 2) {
                monthLabel
                chevronImage
            }
        }
        .id(selectedMonth)
    }
}

// MARK: - UI Properties

private extension MonthPicker {
    @ViewBuilder
    var monthLabel: some View {
        Text("\(selectedMonth.name.capitalized)")
            .foregroundColor(AppColor.Text.gray.color)
            .font(.montserratFont(size: 14, weight: .medium))
    }
    
    @ViewBuilder
    var chevronImage: some View {
        Image(uiImage: .Asset.Common.Chevron.downIcon.image)
            .frame(width: 20, height: 20)
    }
}

// MARK: - Stubable

extension MonthPicker: Stubable {
    static func stub() -> any View {
        return MonthPicker(item: .constant(MonthItem.current))
    }
}

// MARK: - Preview

#Preview {
    MonthPicker.stub()
}
