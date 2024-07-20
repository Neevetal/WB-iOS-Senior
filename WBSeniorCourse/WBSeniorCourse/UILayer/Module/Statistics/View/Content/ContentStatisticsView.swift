//
//  ContentStatisticsView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct ContentStatisticsView: View {
    
    // MARK: - Property Wrappers
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            contentView
                .padding(.init(
                    top: 0, 
                    leading: 30,
                    bottom: 32, 
                    trailing: 24
                ))
        }
    }
}

// MARK: - UI Properties

private extension ContentStatisticsView {
    @ViewBuilder
    private var contentView: some View {
        if horizontalSizeClass == .compact {
            VStack(spacing: 24) {
                salesQuantityView
                marketingSpecialistsView
                externalTrafficView
                aiSupportView
            }
        } else {
            VStack(spacing: 24) {
                salesQuantityView
                HStack(spacing: 24) {
                    marketingSpecialistsView
                    VStack(spacing: 24) {
                        externalTrafficView
                        aiSupportView
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var salesQuantityView: some View {
        SalesQuantityView()
    }
    
    @ViewBuilder
    private var marketingSpecialistsView: some View {
        MarketingSpecialistsView()
    }
    
    @ViewBuilder
    private var externalTrafficView: some View {
        ExternalTrafficView()
    }
    
    @ViewBuilder
    private var aiSupportView: some View {
        AISupportView()
    }
}

// MARK: - Preview

#Preview {
    ContentStatisticsView()
}
