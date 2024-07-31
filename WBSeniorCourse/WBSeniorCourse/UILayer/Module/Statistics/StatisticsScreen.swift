//
//  StatisticsScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct StatisticsScreen: View {
    
    enum State {
        case main
        case widgets
        case share
    }
    
    enum Action {
        case showMain
        case showWidgets
        case share
    }
    
    // MARK: - Property Wrappers
    
    @ObservedObject var store = StatisticsStore<State, Action>(state: .main) { prevState, action in
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
    }
}

// MARK: - UI Properties

private extension StatisticsScreen {
    @ViewBuilder
    private var contentView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                TopBarView(store: store)
                ContentStatisticsView()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    StatisticsScreen()
}
