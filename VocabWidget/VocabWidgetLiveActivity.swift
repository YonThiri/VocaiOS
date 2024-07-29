//
//  VocabWidgetLiveActivity.swift
//  VocabWidget
//
//  Created by Yon Thiri Aung on 25/07/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct VocabWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct VocabWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: VocabWidgetAttributes.self) { context in
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

extension VocabWidgetAttributes {
    fileprivate static var preview: VocabWidgetAttributes {
        VocabWidgetAttributes(name: "World")
    }
}

extension VocabWidgetAttributes.ContentState {
    fileprivate static var smiley: VocabWidgetAttributes.ContentState {
        VocabWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: VocabWidgetAttributes.ContentState {
         VocabWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: VocabWidgetAttributes.preview) {
   VocabWidgetLiveActivity()
} contentStates: {
    VocabWidgetAttributes.ContentState.smiley
    VocabWidgetAttributes.ContentState.starEyes
}
