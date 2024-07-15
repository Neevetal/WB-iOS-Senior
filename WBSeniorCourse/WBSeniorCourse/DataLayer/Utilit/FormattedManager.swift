//
//  FormattedManager.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import Foundation

// MARK: - DateFormatter

struct FormattedManager {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        return formatter
    }()
    
    static func formattedCurrentDate(languageCode: String, style: DateFormatter.Style) -> String {
        Self.dateFormatter.locale = Locale(identifier: "\(languageCode)_\(Locale.current.region?.identifier ?? "US")")
        Self.dateFormatter.dateStyle = style
        Self.dateFormatter.timeStyle = style
        let currentDate = Date()
        return Self.dateFormatter.string(from: currentDate)
    }
}

// MARK: - MeasurementFormatter

extension FormattedManager {
    static let measurementFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        return formatter
    }()
    
    static func formattedDistance(_ meters: Double, languageCode: String, unit: UnitLength) -> String {
        let measurement = Measurement(value: meters, unit: UnitLength.meters).converted(to: unit)
        Self.measurementFormatter.locale = Locale(identifier: "\(languageCode)_\(Locale.current.region?.identifier ?? "US")")
        Self.measurementFormatter.unitOptions = .providedUnit
        return Self.measurementFormatter.string(from: measurement)
    }
}
