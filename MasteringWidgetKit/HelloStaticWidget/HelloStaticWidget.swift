//
//  HelloStaticWidget.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/22.
//

import SwiftUI
import WidgetKit

///ウィジェットの説明、表示名、およびサイズ ファミリとしてシステム メディアを追加
struct HelloStaticWidget: Widget {
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "amatnug.amatnug.HelloStaticWidget", provider: HelloWidgetTimelineProvider()) { _ in
            HelloWidjetView()
        }
        .supportedFamilies([.systemSmall])
    }
}
