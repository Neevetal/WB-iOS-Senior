//
//  SideBarButtonsStackView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 21.07.2024.
//

import SwiftUI

struct SideBarButtonsStackView: View {
    
    // MARK: - Property Wrappers
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Binding private var selectedItem: SideTabBarView.ItemType
    
    // MARK: - Properties
    
    private let itemTypes: [SideTabBarView.ItemType]
    private var stackSpacing: CGFloat {
        return horizontalSizeClass == .compact ? 16 : 64
    }
    
    // MARK: - Initialization and deinitialization
    
    init(
        selectedItem: Binding<SideTabBarView.ItemType>,
        itemTypes: [SideTabBarView.ItemType]
    ) {
        _selectedItem = selectedItem
        self.itemTypes = itemTypes
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: stackSpacing) {
            ForEach(itemTypes, id: \.self) { item in
                Button(action: {
                    withAnimation {
                        selectedItem = item
                    }
                }) {
                    Image(uiImage: item.icon)
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 24, height: 24)
            }
        }
    }
}

// MARK: - Stubable

extension SideBarButtonsStackView: Stubable {
    static func stub() -> any View {
        return SideBarButtonsStackView(
            selectedItem: .constant(.charts),
            itemTypes: SideTabBarView.ItemType.allCases
        )
        .background(Color.black)
    }
}

// MARK: - Preview

#Preview {
    SideBarButtonsStackView.stub()
}
