//
//  WidgetWBSeniorCourseLiveActivity.swift
//  WidgetWBSeniorCourse
//
//  Created by Vitaly Malkov on 03.09.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetWBSeniorCourseAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetWBSeniorCourseLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetWBSeniorCourseAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetWBSeniorCourseAttributes {
    fileprivate static var preview: WidgetWBSeniorCourseAttributes {
        WidgetWBSeniorCourseAttributes(name: "World")
    }
}

extension WidgetWBSeniorCourseAttributes.ContentState {
    fileprivate static var smiley: WidgetWBSeniorCourseAttributes.ContentState {
        WidgetWBSeniorCourseAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetWBSeniorCourseAttributes.ContentState {
         WidgetWBSeniorCourseAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetWBSeniorCourseAttributes.preview) {
   WidgetWBSeniorCourseLiveActivity()
} contentStates: {
    WidgetWBSeniorCourseAttributes.ContentState.smiley
    WidgetWBSeniorCourseAttributes.ContentState.starEyes
}
