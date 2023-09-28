//
//  GroceryWidget.swift
//  CoredataAndWidgetExtensionExtension
//
//  Created by koala panda on 2023/09/28.
//

import WidgetKit
import SwiftUI

struct GroceryWidget: Widget{
    var body: some WidgetConfiguration{
        
        StaticConfiguration(kind: GroceryConstants.widgetKind, provider: GroceryTimelineProvider()) { entry in
            GroceryEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall,.systemMedium,.systemLarge])
        .configurationDisplayName("Grocery Widget")
        .description("Gold old grodery app widget.")
    }
}
