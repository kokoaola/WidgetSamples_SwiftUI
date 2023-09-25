//
//  QuotesWidgetView.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI
import WidgetKit

struct QuotesWidgetView: View {
    var entry: QuotesWidgetEntry
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct QuotesWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = QuotesWidgetEntry(date: Date(), quote: Quote(quoteText: "See the positive side, the potential, and make an effort.", quoteAuthor: "Dalai Lama"))
        QuotesWidgetView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
