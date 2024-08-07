//
//  MarketingSpecialistsView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct MarketingSpecialistsView: View {
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...100, id: \.self) { _ in 
                    MarketingSpecialistRow()
                }
            }
        }
        .frame(height: 438)
        .cornerRadius(28)
    }
}

// MARK: - Preview

#Preview {
    MarketingSpecialistsView()
}
