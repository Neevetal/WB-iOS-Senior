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
        Grid(horizontalSpacing: 0, verticalSpacing: 24) {
            GridRow {
                salesQuantityView
            }
            Grid(horizontalSpacing: 24, verticalSpacing: 24) {
                GridRow {
                    marketingSpecialistsView
                    Grid(horizontalSpacing: 0, verticalSpacing: 24) {
                        GridRow {
                            externalTrafficView
                        }
                        GridRow {
                            aiSupportView
                        }
                    }
                }
            }
        }
        .padding(.init(top: 0, leading: 30, bottom: 32, trailing: 24))
    }
}

// MARK: - UI Properties

private extension ContentStatisticsView {
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
