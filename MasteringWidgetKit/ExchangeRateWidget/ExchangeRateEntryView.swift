//
//  ExchangeRateEntryView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/01.
//

import SwiftUI
import WidgetKit


struct ExchangeRateEntryView: View {
    var entry: ExchangeRateEntry
    
    var body: some View {
        VStack{
            let rows = entry.widgetFamily == .systemMedium ? 2 : 5
            
            ForEach(entry.country.prefix(rows)){country in
                CountryListCell(country: country)
            }
        }
    }
}

struct ExchangeRateEntryView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ExchangeRateEntryView(entry: ExchangeRateEntry(country: Country.sample, widgetFamily: .systemMedium))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            ExchangeRateEntryView(entry: ExchangeRateEntry(country: Country.sample, widgetFamily: .systemLarge))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
