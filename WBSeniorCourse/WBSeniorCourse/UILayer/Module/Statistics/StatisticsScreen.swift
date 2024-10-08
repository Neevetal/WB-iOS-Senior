//
//  StatisticsScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct StatisticsScreen: View {
    
    enum ViewType {
        case main
        case widgets
        case share
    }
    
    enum Action {
        case showMain
        case showWidgets
        case share
    }
    
    // MARK: - Dependencies
    
    @Injected private var statisticsService: StatisticsService
    
    // MARK: - Property Wrappers
    
    @ObservedObject var store = StatisticsStore<ViewType, Action>(state: .main) { prevState, action in
        switch action {
        case .showMain:
            print("Вернулись на главный экран")
            return .main
        case .showWidgets:
            print("Открыли настройку виджетов")
            return .widgets
        case .share:
            print("Поделились статистикой")
            return .share
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        TrendMovementView() {
            contentView
        }
        .task {
            statisticsService.getProducts(limit: 20)
        }
        .environmentObject(statisticsService)
    }
}

// MARK: - UI Properties

private extension StatisticsScreen {
    @ViewBuilder
    var contentView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                TopBarView(store: store)
                ContentStatisticsView()
            }
        }
        .disableBounces()
    }
}

// MARK: - Stubable

extension StatisticsScreen: Stubable {
    static func stub() -> any View {
        let store = StatisticsStore<StatisticsScreen.ViewType, StatisticsScreen.Action>(state: StatisticsScreen.ViewType.main) { prevState, action in
            switch action {
            case .showMain:
                print("Вернулись на главный экран")
                return .main
            case .showWidgets:
                print("Открыли настройку виджетов")
                return .widgets
            case .share:
                print("Поделились статистикой")
                return .share
            }
        }
        
        return StatisticsScreen(store: store)
            .environmentObject(StatisticsService())
    }
}

// MARK: - Preview

#Preview {
    StatisticsScreen.stub()
}
