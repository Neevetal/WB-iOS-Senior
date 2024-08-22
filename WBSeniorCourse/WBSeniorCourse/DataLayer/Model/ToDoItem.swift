//
//  ToDoItem.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 22.08.2024.
//

import Foundation
import SwiftData

@Model
class ToDoItem: Identifiable {
    var id: UUID
    var title: String
    var isDone: Bool
    
    // MARK: - Initialization and deinitialization
    
    init(
        title: String,
        isDone: Bool = false
    ) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
}

// MARK: - Mock

extension ToDoItem {
    static func mock() -> ToDoItem {
        return ToDoItem(title: "Заголовок")
    }
}
