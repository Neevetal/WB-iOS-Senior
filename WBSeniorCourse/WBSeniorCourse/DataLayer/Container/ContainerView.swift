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
    }
}

// MARK: - Private methods

private extension ContainerView {
    func makeOpaqueContainer<T: Container>(container: T) -> some Container {
        return container
    }
}

// MARK: - Preview

#Preview {
    ContainerView()
}
