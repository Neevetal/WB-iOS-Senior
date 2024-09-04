//
//  ToDoItem.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 22.08.2024.
//

import Foundation

class ToDoItem: Identifiable, Codable {
    let id: UUID
    let creationDate: Date
    let title: String
    var isDone: Bool
    var doneDate: Date?
    
    // MARK: - Initialization and deinitialization
    
    init(title: String) {
        self.id = .init()
        self.creationDate = .now
        self.title = title
        self.isDone = false
        self.doneDate = nil
    }
}
    
// MARK: - Public methods

extension ToDoItem {
    static func getFromStore() -> [ToDoItem] {
        if let jsonData = (UserDefaults(suiteName: "group.com.wbToDoItems")!.string(forKey: "tasks") ?? "").data(using: .utf8) {
            return (try? JSONDecoder().decode([ToDoItem].self, from: jsonData)) ?? []
        }
        
        return []
    }
    
    static func saveToStore(_ newTasks: [ToDoItem] ) {
        if let jsonData = try? JSONEncoder().encode(newTasks) {
            let jsonString = String(data: jsonData, encoding: .utf8)!
            UserDefaults(suiteName: "group.com.wbToDoItems")!.set(jsonString, forKey: "tasks")
        }
    }
    
    func setStatus(isDone: Bool) {
        self.isDone = isDone
        self.doneDate = isDone ? .now : nil
        addOrUpdate()
    }
    
    func delete() {
        var allTasks = ToDoItem.getFromStore()
        
        if let index = allTasks.firstIndex(where: { $0.id == self.id }) {
            allTasks.remove(at: index)
        }
        
        ToDoItem.saveToStore(allTasks)
    }
    
    func addOrUpdate() {
        var allTasks = ToDoItem.getFromStore()
        
        if let index = allTasks.firstIndex(where: { $0.id == self.id }) {
            allTasks[index] = self
        } else {
            allTasks.append(self)
        }
        
        ToDoItem.saveToStore(allTasks)
    }
}

// MARK: - Mock

extension ToDoItem {
    static func mock() -> ToDoItem {
        return ToDoItem(title: "Заголовок")
    }
    
    static func arrayMock() -> [ToDoItem] {
        return [
            ToDoItem(title: "Заголовок 1"),
            ToDoItem(title: "Заголовок 2"),
            ToDoItem(title: "Заголовок 3")
        ]
    }
}
