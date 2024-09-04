//
//  ToDoListView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 22.08.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    // MARK: - Property Wrappers
    
    @Environment(\.scenePhase) var scenePhase
    @State private var items: [ToDoItem] = []
    @State var newTaskTitle: String = ""
    
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
        TextField(AppString.ToDo.enterNewItem, text: $newTaskTitle)
            .textFieldStyle(.plain)
            .padding()
    }
    
    @ViewBuilder
    var addButton: some View {
        Button(AppString.ToDo.addItem, action: createNewTask)
            .disabled(newTaskTitle.isEmpty)
    }
    
    @ViewBuilder
    var itemsList: some View {
        List(items) { item in
            ToDoRow(item: item) {
                rereadUserTasks()
            }
        }
        .onAppear {
            rereadUserTasks()
        }
    }
}

// MARK: - Private methods

private extension ToDoListView {
    func createNewTask() {
        let newTask = ToDoItem(title: newTaskTitle)
        newTask.addOrUpdate()
        rereadUserTasks()
    }
    
    func rereadUserTasks() {
        items = ToDoItem.getFromStore().sorted(by: { $0.creationDate > $1.creationDate })
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
                ForEach(items) { item in
                    ToDoRow(item: item) {}
                }
            }
        }
        .onAppear {
            rereadUserTasks()
        }
    }
}

// MARK: - Preview

#Preview {
    ToDoListView()
}
