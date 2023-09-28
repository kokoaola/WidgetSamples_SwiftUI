//
//  ReminderWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI
import WidgetKit


struct ReminderWidget: Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: ReminderAppConstants.widgetKind, provider: ReminderTimelineProvider()) { entry in
            ReminderWidgetView(count: entry.reminderCount)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Reminders Widget")
        .description("Widget to show number of reminders in Reminders App")
    }
}
