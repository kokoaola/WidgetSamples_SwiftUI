//
//  HelloStaticWidget.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/22.
//

import SwiftUI
import WidgetKit

struct HelloStaticWidget: Widget {
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "amatnug.amatnug.WidjetTestProject", provider: HelloWidgetTimelineProvider()) { _ in
            HelloWidjetView()
        }
        .supportedFamilies([.systemSmall])
    }
}
