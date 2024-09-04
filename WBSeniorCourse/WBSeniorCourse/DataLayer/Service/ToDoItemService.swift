//
//  ToDoItemService.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 05.09.2024.
//

import SwiftUI

final class ToDoItemService {
    
    // MARK: - Constants
    
    private static let groupName = "group.com.wbToDoItems"
    
    // MARK: - Property Wrappers
    
    @State public var newItemTitle: String = ""
    public var items: [ToDoItem] = []
    
    // MARK: - Initialization and deinitialization
    
//    init(newItemTitle: String, items: [ToDoItem]) {
//        self.newItemTitle = newItemTitle
//        self.items = items
//    }
}

// MARK: - Public methods

extension ToDoItemService {
    func addNewItem() {
        let item = ToDoItem(title: newItemTitle)
        items.append(item)
//        context.insert(item)
//        newItemTitle = ""
    }
    
    /// Get all tasks from store
    /// - Returns: all tasks from store
    static func getFromStore() -> [ToDoItem] {
        if let jsonData = (UserDefaults(suiteName: groupName)!
            .string(forKey: "tasks") ?? "")
            .data(using: .utf8) {
            return (try? JSONDecoder().decode(
                [ToDoItem].self,
                from: jsonData)
            ) ?? []
        }
        
        return []
    }
    
    /// Save task list to store
    /// - Parameter newTasks: new task list
    static func saveToStore(_ newTasks: [ToDoItem] ) {
        // 1. serialize array to JSON string
        if let jsonData = try? JSONEncoder().encode(newTasks) {
            let jsonString = String(data: jsonData, encoding: .utf8)!
            // 2. save JSON string to UserDefaults
            UserDefaults(suiteName: groupName)!.set(jsonString, forKey: "tasks")
        }
    }
    
    func addOrUpdate(item: ToDoItem) {
        // 1. get all tasks
        var allTasks = ToDoItemService.getFromStore()
        
        // 2. try to find task in store
        if let index = allTasks.firstIndex(where: { $0.id == item.id }) {
            // task exists, updating
            allTasks[index] = item
        } else {
            // it's a new task, add new
            allTasks.append(item)
        }
        
        // 3. save all changes to the store
        ToDoItemService.saveToStore(allTasks)
    }
}
