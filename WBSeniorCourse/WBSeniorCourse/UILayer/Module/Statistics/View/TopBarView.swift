//
//  TopBarView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text("Hello,")
            Spacer()
            Text(" World!")
        }
        .foregroundColor(.white)
    }
}

// MARK: - Preview

#Preview {
    TopBarView()
}
