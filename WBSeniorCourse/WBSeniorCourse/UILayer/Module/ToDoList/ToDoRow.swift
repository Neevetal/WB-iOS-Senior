//
//  ToDoRow.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 22.08.2024.
//

import SwiftUI

struct ToDoRow: View {
    
    // MARK: - Properties
    
    var item: ToDoItem
    
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
            item.isDone.toggle()
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
             //   context.delete(item)
            }
    }
}

// MARK: - Stubable

extension ToDoRow: Stubable {
    static func stub() -> any View {
        return ToDoRow(item: ToDoItem.mock())
    }
}

// MARK: - Preview

#Preview {
    ToDoRow.stub()
}
