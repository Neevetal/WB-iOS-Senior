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
        switch horizontalSizeClass {
        case .compact:
            smallGrid
        case .regular:
            switch UIDevice.current.orientation {
            case .portrait, .portraitUpsideDown:
                smallGrid
            case .landscapeLeft, .landscapeRight:
                fullGrid
            default:
                EmptyView()
            }
        default:
            EmptyView()
        }
    }
}

// MARK: - UI Properties

private extension ContentStatisticsView {
    @ViewBuilder
    var smallGrid: some View {
        VStack(spacing: 24) {
            salesQuantityView
            marketingSpecialistsView
            externalTrafficView
            aiSupportView
        }
        .frame(minWidth: 100, maxWidth: 500)
        .padding(.init(top: 0, leading: 8, bottom: 16, trailing: 8))
    }
    
    @ViewBuilder
    var fullGrid: some View {
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
    
    @ViewBuilder
    var salesQuantityView: some View {
        SalesQuantityView()
            .frame(height: 445)
    }
    
    @ViewBuilder
    var marketingSpecialistsView: some View {
        MarketingSpecialistsView()
            .frame(height: 438)
    }
    
    @ViewBuilder
    var externalTrafficView: some View {
        ExternalTrafficView()
            .frame(height: 280)
    }
    
    @ViewBuilder
    var aiSupportView: some View {
        AISupportView()
            .frame(height: 134)
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
