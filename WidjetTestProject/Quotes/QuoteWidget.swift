//
//  QuoteWidget.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI
import WidgetKit

///ウィジェットの説明、表示名、およびサイズ ファミリとしてシステム メディアを追加

struct QuotesWidget: Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "amatnug.amatnug.QuotesWidget", provider: QuoteTimeLineProvider()){entry in
            QuotesWidgetView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Famous Quotes")
        .description("Widget to display famous quotes.")
    }
}

