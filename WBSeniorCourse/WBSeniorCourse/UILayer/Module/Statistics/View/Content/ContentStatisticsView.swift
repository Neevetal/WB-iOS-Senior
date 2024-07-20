//
//  ContentStatisticsView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct ContentStatisticsView: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            salesQuantityView
            HStack {
                marketingSpecialistsView
                VStack {
                    externalTrafficView
                    aiSupportView
                }
            }
        }
    }
}

// MARK: - UI Properties

private extension ContentStatisticsView {
    @ViewBuilder
    private var salesQuantityView: some View {
        SalesQuantityView()
            .background(Color.red)
    }
    
    @ViewBuilder
    private var marketingSpecialistsView: some View {
        MarketingSpecialistsView()
            .background(Color.green)
    }
    
    @ViewBuilder
    private var externalTrafficView: some View {
        ExternalTrafficView()
            .background(Color.yellow)
    }
    
    @ViewBuilder
    private var aiSupportView: some View {
        AISupportView()
            .background(Color.blue)
    }
}

// MARK: - Preview

#Preview {
    ContentStatisticsView()
}
