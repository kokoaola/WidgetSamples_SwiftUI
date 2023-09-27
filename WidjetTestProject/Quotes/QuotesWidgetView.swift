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
        VStack(spacing: 5){
            Text(entry.quote.quoteText)
                .minimumScaleFactor(0.7)
            
            HStack {
                Spacer()
                Text("-")
                Text(entry.quote.quoteAuthor)
                    .italic()
            }
            .font(.footnote)
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.orange.gradient.opacity(0.5))
    }
}

struct QuotesWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = QuotesWidgetEntry(date: Date(), quote: Quote(quoteText: "See the positive side, the potential, and make an effort.", quoteAuthor: "Dalai Lama"))
        QuotesWidgetView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
