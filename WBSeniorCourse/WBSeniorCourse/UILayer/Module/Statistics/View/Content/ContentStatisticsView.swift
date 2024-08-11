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
    var salesQuantityView: some View {
        SalesQuantityView()
    }
    
    @ViewBuilder
    var marketingSpecialistsView: some View {
        MarketingSpecialistsView()
    }
    
    @ViewBuilder
    var externalTrafficView: some View {
        ExternalTrafficView()
    }
    
    @ViewBuilder
    var aiSupportView: some View {
        AISupportView()
    }
}

// MARK: - Stubable

extension ContentStatisticsView: Stubable {
    static func stub() -> any View {
        return ContentStatisticsView()
            .environmentObject(StatisticsService())
    }
}

// MARK: - Preview

#Preview {
    ContentStatisticsView.stub()
}
