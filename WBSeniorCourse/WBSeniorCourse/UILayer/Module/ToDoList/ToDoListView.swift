//
//  ToDoListView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 22.08.2024.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @State private var newItemTitle = ""
    @Environment(\.modelContext) private var context
    @Query var todos: [ToDoItem]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter new item", text: $newItemTitle)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Add Item", action: addNewItem)
                
                List(todos) { item in
                    ToDoRow(item: item)
                }
            }
            .navigationTitle("Todo List")
        }
    }
    
    private func addNewItem() {
        context.insert(ToDoItem(title: newItemTitle))
        newItemTitle = ""
    }
}

#Preview {
    ToDoListView()
}
