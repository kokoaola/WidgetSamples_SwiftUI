//
//  QuotesTimelineProvider.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/25.
//

import SwiftUI
import WidgetKit

struct QuoteTimeLineProvider: TimelineProvider {
    // このプロバイダが提供するタイムラインエントリの型を設定
    typealias Entry = QuotesWidgetEntry
    
    // プレースホルダーとして表示するデフォルトの引用文
    let placeholderQuote = Quote(quoteText: "See the positive side, the potential, and make an effort.", quoteAuthor: "Dalai Lama")
    
    // プレースホルダーエントリを生成。主にWidgetのプレビューに使用される
    func placeholder(in context: Context) -> QuotesWidgetEntry {
        QuotesWidgetEntry(date: Date(), quote: placeholderQuote)
    }
    
    // クイックルック（3D Touchメニュー）で表示するエントリを生成
    func getSnapshot(in context: Context, completion: @escaping (QuotesWidgetEntry) -> Void) {
        completion(QuotesWidgetEntry(date: Date(), quote: placeholderQuote))
    }
    
    // タイムラインを生成。ここで実際のデータを非同期に取得し、タイムラインエントリとして設定する
    func getTimeline(in context: Context, completion: @escaping (Timeline<QuotesWidgetEntry>) -> Void) {

        //Taskはブロック内のコードがすべて非同期に実行される。これにより長時間かかる可能性のある操作（例えば、ネットワークリクエストやディスクからのデータ読み取り）を、アプリケーションの主要な実行スレッド（メインスレッド）をブロックすることなく実行できる
        Task{
            do{
                // QuotesServiceを使用して引用文を非同期に取得
                let quote = try await QuotesService().getQuotes()
                // 取得した引用文を基に新しいエントリを生成
                let entry = QuotesWidgetEntry(date: Date(), quote: quote)
                // 次の更新時間を設定。ここでは現在時間から30秒後に設定
                let refreshTime = Calendar.current.date(byAdding: .second, value: 30, to: Date())!
                // タイムラインオブジェクトを生成し、completionハンドラに渡す
                let timeline = Timeline(entries: [entry], policy: .after(refreshTime))
                completion(timeline)
            }catch{
                // エラーが発生した場合、エラーメッセージをコンソールに出力
                print(error.localizedDescription)
            }
        }
    }
}
