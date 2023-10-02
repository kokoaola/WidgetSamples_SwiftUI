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
            
            // entry.countryから先頭の`rows`数の国をループ処理する
            ForEach(entry.country.prefix(rows)) { country in
                // Linkビューで指定したURLにリンクを提供し、国の通貨コードをURLの一部として使用してリンク先を作成
                ///Link:タップされたときに指定された URL にユーザーをナビゲートさせる。iOSアプリ内でウェブページを開く場合や、別のアプリにリンクする場合などに利用されます。これにより、アプリ内でウェブコンテンツや他のアプリへのリンクを簡単に作成できる
                ///はじめにinfo.plistでCFBundleURLSchemesを作成し、新しいスキームを登録する(今回はsampleって名前のスキームを作った)
                ///ExchangeRateAppでリンクを受け取る
                Link(destination: URL(string: "sample://exchangerate/\(country.currencyCode)")!) {
                    // CountryListCellビューで国情報を表示する
                    CountryListCell(country: country)
                }
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
