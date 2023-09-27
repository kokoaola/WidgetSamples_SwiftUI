//
//  PhotoWidget.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI
import WidgetKit

struct PhotoWidget:Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "amatnug.amatnug.PhostoWidget", provider: PhotoWidgetTimelineProvider()) { entry in
            PhotoWidgetView(entry: entry)
        }
        .supportedFamilies([.systemLarge])
        .description("Widget to show nature photo.")
        .configurationDisplayName("Photo Widget")
    }
    
    
}
