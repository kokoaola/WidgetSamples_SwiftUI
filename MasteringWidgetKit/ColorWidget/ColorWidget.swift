//
//  ColorWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/28.
//

import SwiftUI
import WidgetKit


struct ColorWidget:Widget{
    var body: some WidgetConfiguration{
        IntentConfiguration(kind: "amatnug.amatnug.ColorWidget", intent: ColorSelectionIntentIntent.self, provider: ColorWidgetTimelineProvider()) { entry in
            ColorWidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Configurable color widget")
        .description("Widget to show dynamic configuration.")
    }
}
