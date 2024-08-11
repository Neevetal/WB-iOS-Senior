//
//  MonthItem.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 11.08.2024.
//

import Foundation

struct MonthItem: Identifiable, Hashable {
    let id: Int
    let name: String
    
    // MARK: - Initialization and deinitialization
    
    init(
        month: Int,
        calendar: Calendar = Calendar.current
    ) {
        self.id = month
        
        if let date = calendar.date(
            bySetting: .month,
            value: month,
            of: Date()
        ) {
            self.name = FormattedManager.monthFormatter.string(from: date)
        } else {
            self.name = ""
        }
    }
    
    // MARK: - Current
    
    static var current: MonthItem {
        let monthInt = Calendar.current.dateComponents(
            [.month],
            from: Date()
        ).month ?? 0
        
        return .init(month: monthInt)
    }
}
