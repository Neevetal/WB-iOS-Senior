//
//  ToDoRow.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 22.08.2024.
//

import SwiftUI

struct ToDoRow: View {
    
    // MARK: - Properties
    
    public var item: ToDoItem
    private let updateAction: () -> Void
    
    // MARK: - Initialization and deinitialization
    
    init(item: ToDoItem, _ updateAction: @escaping () -> Void) {
        self.item = item
        self.updateAction = updateAction
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            doneImage
            titleLabel
            Spacer()
            deleteImage
        }
        .padding()
    }
}

// MARK: - UI Properties

private extension ToDoRow {
    @ViewBuilder
    var doneImage: some View {
        Image(
            systemName: item.isDone
            ? "checkmark.circle.fill"
            : "circle"
        )
        .foregroundColor(
            item.isDone
            ? .green
            : .gray
        )
        .onTapGesture {
            item.setStatus(isDone: !item.isDone)
        }
    }
    
    @ViewBuilder
    var titleLabel: some View {
        Text(item.title)
            .strikethrough(item.isDone)
    }
    
    @ViewBuilder
    var deleteImage: some View {
        Image(systemName: "trash")
            .foregroundColor(.red)
            .onTapGesture {
                item.delete()
                updateAction()
            }
    }
}

// MARK: - Stubable

extension ToDoRow: Stubable {
    static func stub() -> any View {
        return ToDoRow(item: ToDoItem.mock()) {}
    }
}

// MARK: - Preview

#Preview {
    ToDoRow.stub()
}
