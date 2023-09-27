//
//  HelloWidjetTimelineProvider.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/22.
//

import WidgetKit

// TimelineProviderプロトコルに準拠したstructを定義。これによりWidgetで表示するデータの取得や更新のタイミングを管理できる
struct HelloWidgetTimelineProvider: TimelineProvider {
    // typealiasを用いてEntryにHelloWidgetEntryを割り当て。これにより、Entryの型をHelloWidgetEntryとして扱える
    typealias Entry = HelloWidgetEntry
    
    // placeholderメソッドはWidgetのプレビューを表示する際に使用するデータを生成
    func placeholder(in context: Context) -> HelloWidgetEntry {
        // HelloWidgetEntryのインスタンスを現在の日付で初期化して返す
        HelloWidgetEntry(date: Date())
    }
    
    // getSnapshotメソッドはWidgetのクイックルック（3D Touchメニュー）で表示するデータを生成
    func getSnapshot(in context: Context, completion: @escaping (HelloWidgetEntry) -> Void) {
        // HelloWidgetEntryのインスタンスを現在の日付で初期化してcompletionハンドラに渡す
        completion(HelloWidgetEntry(date: Date()))
    }
    
    // getTimelineメソッドはWidgetに表示するデータの配列とその更新ポリシーを管理
    func getTimeline(in context: Context, completion: @escaping (Timeline<HelloWidgetEntry>) -> Void) {
        // 今回は更新ポリシーを.neverに設定し、配列には現在の日付で初期化したHelloWidgetEntryのインスタンスを1つだけ含める
        completion(Timeline(entries: [HelloWidgetEntry(date: Date())], policy: .never))
    }
}
