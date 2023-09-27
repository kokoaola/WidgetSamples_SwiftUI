//
//  WeatherWidget.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI
import WidgetKit

struct WeatherWidget: Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "amatnug.amatnug.WeatherWidget", provider: WeatherTimelineProvider()) { entry in
            WeatherWidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("NY Weather")
        .description("Widget to display NY Weather.")
    }
}
