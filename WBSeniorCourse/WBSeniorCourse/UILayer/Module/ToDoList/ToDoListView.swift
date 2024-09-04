//
//  ToDoListView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 22.08.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    // MARK: - Dependencies
    
    private let service = ToDoItemService()
    
    // MARK: - Body
    
    var body: some View {
#if os(watchOS)
        watchView
        #else
        NavigationView {
            VStack {
                newItemTextField
                addButton
                itemsList
            }
            .navigationTitle(AppString.ToDo.navigationTitle)
        }
#endif
    }
}

// MARK: - UI Properties

private extension ToDoListView {
    @ViewBuilder
    var newItemTextField: some View {
        TextField(AppString.ToDo.enterNewItem, text: service.$newItemTitle)
            .textFieldStyle(.plain)
            .padding()
    }
    
    @ViewBuilder
    var addButton: some View {
        Button(AppString.ToDo.addItem, action: service.addNewItem)
            .disabled(service.newItemTitle.isEmpty)
    }
    
    @ViewBuilder
    var itemsList: some View {
        List(service.items) { item in
            ToDoRow(item: item)
        }
    }
}

// MARK: - WatchOS

private extension ToDoListView {
    @ViewBuilder
    var watchView: some View {
        ScrollView(.vertical) {
            Group {
                newItemTextField
                addButton
                ForEach(service.items) { item in
                    ToDoRow(item: item)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ToDoListView()
}
