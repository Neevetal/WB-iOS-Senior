//
//  ContainerView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import SwiftUI

struct ContainerView: View {
    
    // MARK: - Body
    
    var body: some View {
        Text("ContainerView")
            .onAppear {
                start()
            }
    }
}

// MARK: - Private methods

private extension ContainerView {
    func makeOpaqueContainer<T: Container>(container: T) -> some Container {
        return container
    }
    
    func start() {
        print("Start")
    }
}

// MARK: - Preview

#Preview {
    ContainerView()
}
