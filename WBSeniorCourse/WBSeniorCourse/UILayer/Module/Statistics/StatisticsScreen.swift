//
//  StatisticsScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct StatisticsScreen: View {
    
    // MARK: - Body
    
    var body: some View {
        TrendMovementView() {
            contentView
        }
    }
}

// MARK: - UI Properties

private extension StatisticsScreen {
    @ViewBuilder
    private var contentView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                TopBarView()
                ContentStatisticsView()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    StatisticsScreen()
}
