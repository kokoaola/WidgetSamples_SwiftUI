//
//  PedometerWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/02.
//

import SwiftUI
import WidgetKit


struct PedometerWidget: Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: PedometerAppConstants.widgetKind, provider: PedometerTimelineProvider()) { entry in
            PedometerEntryView(entry: entry)
        }
        .supportedFamilies([.accessoryCircular])
        .configurationDisplayName("Lock screen pedometer")
        .description("Widget to show on lock screen.")
    }
}
