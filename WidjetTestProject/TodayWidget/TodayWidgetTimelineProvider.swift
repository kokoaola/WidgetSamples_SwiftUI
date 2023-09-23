//
//  TodayWidgetTimelineProvider.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/23.
//

import WidgetKit

//５分ごとのエントリでタイムラインを作成

struct TodayWidgetTimelineProvider: TimelineProvider{
    // typealiasを使用して、EntryとしてTodayWidgetEntryを定義
    // これにより、この構造体内でEntryと書いた場合、TodayWidgetEntryと同義となる
    typealias Entry = TodayWidgetEntry
    
    // placeholderメソッドは、Widgetがロードされる際のプレースホルダーとして表示するEntryを返す
    func placeholder(in context: Context) -> TodayWidgetEntry {
        // 現在の日付を含むTodayWidgetEntryを返す。
        return TodayWidgetEntry(date: Date())
    }
    
    // getSnapshotメソッドはWidgetのクイックルック（3D Touchメニュー）で表示するデータを生成
    func getSnapshot(in context: Context, completion: @escaping (TodayWidgetEntry) -> Void) {
        // 現在の日付でTodayWidgetEntryを作成し、completionハンドラに渡す。
        completion(TodayWidgetEntry(date: Date()))
    }
    
    // getTimelineメソッドは、表示するTimelineを生成する。Timelineは複数のEntryで構成される。
    func getTimeline(in context: Context, completion: @escaping (Timeline<TodayWidgetEntry>) -> Void) {
        // entriesは表示するTodayWidgetEntryの配列。
        var entries = [TodayWidgetEntry]()
        let currentDateTime = Date()
        
        // 次の５分間のEntryを生成し、entriesに追加する。
        for minuteOffset in 1...5 {
            // minuteOffset分後の日付を計算し、その日付でTodayWidgetEntryを作成し、entriesに追加。
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDateTime)!
            let entry = TodayWidgetEntry(date: entryDate)
            entries.append(entry)
        }
        
        // entriesでTimelineを作成し、policyは.atEnd（最後のEntryが表示された後に次のTimelineの5エントリを要求）。
        let timeline = Timeline(entries: entries, policy: .atEnd)
        // 完成したTimelineをcompletionハンドラに渡す。
        completion(timeline)
    }
}
