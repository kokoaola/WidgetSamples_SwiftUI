//
//  ExchangeRateWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/01.
//

import SwiftUI
import WidgetKit


struct ExchangeRateWidget: Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "amatnug.amatnug.ExchangeWidget", provider: ExchangeRateTimelineProvider()) { entry in
            ExchangeRateEntryView(entry: entry)
        }
        .supportedFamilies([.systemLarge, .systemMedium])
        .configurationDisplayName("Exchange Rate Widget")
        .description("Shortcut to current exchange rates around the world!")
    }
}
