//
//  TodayWidget.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/24.
//

import SwiftUI
import WidgetKit

struct TodayWidget: Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "amatnug.amatnug.TodayWidget", provider: TodayWidgetTimelineProvider()) { entry in
            TodayWidgetView(entry: entry)
                
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("TodayWidget")
        .description("Widget to show today's date")
    }
}
