//
//  StatisticsStore.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 31.07.2024.
//

import SwiftUI

final class StatisticsStore<State, Action>: ObservableObject {
    typealias Reducer = (State, Action) -> State
    
    // MARK: - Property Wrappers
    
    @Published var state: State
    
    // MARK: - Properties
    
    private let reducer: Reducer
    
    // MARK: - Initialization and deinitialization
    
    init(state: State, reducer: @escaping Reducer) {
        self.state = state
        self.reducer = reducer
    }
}

// MARK: - Public methods

extension StatisticsStore {
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
