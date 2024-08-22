//
//  ToDoListView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 22.08.2024.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    
    // MARK: - Property Wrappers
    
    @Environment(\.modelContext) private var context
    @State private var newItemTitle = ""
    @Query var items: [ToDoItem]
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                newItemTextField
                addButton
                itemsList
            }
            .navigationTitle(AppString.ToDo.navigationTitle)
        }
    }
}

// MARK: - UI Properties

private extension ToDoListView {
    @ViewBuilder
    var newItemTextField: some View {
        TextField(AppString.ToDo.enterNewItem, text: $newItemTitle)
            .textFieldStyle(.roundedBorder)
            .padding()
    }
    
    @ViewBuilder
    var addButton: some View {
        Button(AppString.ToDo.addItem, action: addNewItem)
    }
    
    @ViewBuilder
    var itemsList: some View {
        List(items) { item in
            ToDoRow(item: item)
        }
    }
}

// MARK: - Private methods

private extension ToDoListView {
    func addNewItem() {
        context.insert(ToDoItem(title: newItemTitle))
        newItemTitle = ""
    }
}

// MARK: - Preview

#Preview {
    ToDoListView()
}
