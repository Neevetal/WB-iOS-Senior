//
//  TopBarView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Property Wrappers
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @ObservedObject var store: StatisticsStore<StatisticsScreen.State, StatisticsScreen.Action>
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 24) {
            statisticsLabel
            Spacer()
            displayingWidgetsButton
            shareButton
        }
        .foregroundColor(.white)
        .padding(.init(top: 32, leading: 30, bottom: 24, trailing: 24))
    }
}

// MARK: - UI Properties

private extension TopBarView {
    @ViewBuilder
    var statisticsLabel: some View {
        Text(AppString.Statistics.statistics)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(
                size: horizontalSizeClass == .regular ? 24 : 18,
                weight: .semiBold
            ))
    }
    
    @ViewBuilder
    var displayingWidgetsButton: some View {
        ImageTitleButton(
            text: horizontalSizeClass == .regular
            ? AppString.Statistics.displayingWidgets
            : "",
            icon: .Asset.Statistics.slidersIcon.image
        ) {
            store.dispatch(action: .showWidgets)
        }
    }
    
    @ViewBuilder
    var shareButton: some View {
        ImageTitleButton(
            text: horizontalSizeClass == .regular
            ? AppString.Statistics.share
            : "",
            icon: .Asset.Statistics.shareIcon.image
        ) {
            store.dispatch(action: .share)
        }
    }
}

// MARK: - Stubable

extension TopBarView: Stubable {
    static func stub() -> any View {
        return TopBarView(store: .init(state: .main, reducer: { _,_ in return .share }))
            .background(Color.black)
    }
}

// MARK: - Preview

#Preview {
    TopBarView.stub()
}
