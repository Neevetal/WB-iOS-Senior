//
//  RoundedCorner.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 21.07.2024.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    // MARK: - Properties
    
    private let radius: CGFloat
    private let corners: UIRectCorner
    
    // MARK: - Initialization and deinitialization
    
    init(
        radius: CGFloat = .infinity,
        corners: UIRectCorner = .allCorners
    ) {
        self.radius = radius
        self.corners = corners
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius
            ))
        
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
