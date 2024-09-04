//
//  WidgetWBSeniorCourse.swift
//  WidgetWBSeniorCourse
//
//  Created by Vitaly Malkov on 03.09.2024.
//

import WidgetKit
import SwiftUI
import SwiftData

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry.mock()
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if context.isPreview {
            return completion(SimpleEntry.mock())
        }
        
        completion(SimpleEntry.current)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if context.isPreview {
            // if isPreview, then it was called from the widget gallery
            return completion( Timeline(entries: [SimpleEntry.mock()], policy: .never))
        }

        completion( Timeline(entries: [SimpleEntry.current], policy: .never))
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let items: [ToDoItem]
    
    static var current: SimpleEntry {
        let service = ToDoItemService()
        return SimpleEntry(date: .now, items: ToDoItem.arrayMock())
    }
}

// MARK: - Mock

extension SimpleEntry {
    static func mock() -> SimpleEntry {
        return SimpleEntry(date: .now, items: ToDoItem.arrayMock())
    }
}

struct WidgetWBSeniorCourseEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            ForEach(entry.items) { item in
                ToDoRow(item: item)
            }
        }
        .padding(.vertical, 12)
    }
}

struct WidgetWBSeniorCourse: Widget {
    let kind: String = "WidgetWBSeniorCourse"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetWBSeniorCourseEntryView(entry: entry)
                .containerBackground(.clear, for: .widget)
        }
    }
}

#Preview(as: .systemSmall) {
    WidgetWBSeniorCourse()
} timeline: {
    SimpleEntry.mock()
}
