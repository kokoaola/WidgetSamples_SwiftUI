//
//  PhotoWidgetTimelineProvider.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI
import WidgetKit

struct PhotoWidgetTimelineProvider: TimelineProvider{
    
    // EntryはPhotoWidtetEntryタイプのエイリアスで、タイムラインプロバイダが扱うエントリタイプを定義する
    typealias Entry = PhotoWidtetEntry
    
    // placeholderメソッド：ウィジェットのプレースホルダー表示に使用されるエントリを作成
    func placeholder(in context: Context) -> PhotoWidtetEntry {
        return PhotoWidtetEntry(date: Date(), imageUrl: "https://source.unsplash.com/random/?nature")
    }
    
    // getSnapshotメソッド：クイックルック（ユーザーが選択するときのメニュー）で表示するエントリを生成
    func getSnapshot(in context: Context, completion: @escaping (PhotoWidtetEntry) -> Void) {
        // デフォルトの日付と画像URLを持つエントリをcompletionハンドラに渡す
        completion(PhotoWidtetEntry(date: Date(), imageUrl: "https://source.unsplash.com/random/?nature"))
    }
    
    // getTimelineメソッドは、ウィジェットのタイムラインを提供する
    func getTimeline(in context: Context, completion: @escaping (Timeline<PhotoWidtetEntry>) -> Void) {
        // 現在の日付と時間を取得
        let currentDate = Date()
        // タイムラインのエントリ配列を作成
        var entries = [PhotoWidtetEntry]()
        // 5つのエントリを作成し、それぞれのエントリに1分ずつ間隔をあけて、次の日付と画像URLを設定
        for i in 1...5{
            let nextDate = Calendar.current.date(bySetting: .minute, value: i, of: currentDate)!
            let entry = PhotoWidtetEntry(date: nextDate, imageUrl: "https://source.unsplash.com/random/?nature")
            entries.append(entry)
        }
        // エントリの配列と更新ポリシーを持つTimelineオブジェクトを作成
        // 最後のエントリが表示された後にウィジェットを更新（.atEnd）
        let timeline = Timeline(entries: entries, policy: .atEnd)
        // completionハンドラにタイムラインを渡して、ウィジェットにタイムラインを提供
        completion(timeline)
    }
}

