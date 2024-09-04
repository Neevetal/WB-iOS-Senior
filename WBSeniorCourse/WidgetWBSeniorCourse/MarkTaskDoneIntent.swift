//
//  MarkTaskDoneIntent.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 05.09.2024.
//

import WidgetKit
import AppIntents

struct MarkTaskDoneIntent: AppIntent {
    static var title: LocalizedStringResource = "Mark task as done"
    static var description = IntentDescription("Make task done or undone")
    
    init() {
        self.taskId = nil
    }
    
    init(_ taskId: String) {
        self.taskId = taskId
    }
    
    @Parameter(title: "Task Id")
    var taskId: String?
    
    func perform() async throws -> some IntentResult {
        if taskId == nil { return .result() }
        
        let allTasks = ToDoItem.getFromStore()
        
        if var task = allTasks.first(where: { $0.id.uuidString == taskId }) {
            task.setStatus(isDone: !task.isDone)
            try? await Task.sleep(nanoseconds: 1_500_000_000)
        }
        
        return .result()
    }
}

