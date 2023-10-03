//
//  FamousPlaceMapWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/03.
//

import SwiftUI
import WidgetKit


struct FamousPlaceMapWidget: Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "gungatam.guntama.FamousPlaceMapWidget", provider: FamousPlaceMapProvider()) { entry in
            FamousPlaceMapWidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("Famous Place Map Widget")
        .description("Widget to show map of famous place around the world.")
    }
}
