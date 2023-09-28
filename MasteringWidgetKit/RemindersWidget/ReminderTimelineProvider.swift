//
//  ReminderTimelineProvider.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI
import WidgetKit


struct ReminderTimelineProvider: TimelineProvider{
    
    // エントリータイプをReminderWidgetEntryに設定
    typealias Entry = ReminderWidgetEntry
    
    // placeholder関数で、プレースホルダーエントリを生成。これはWidgetのローディング時などに表示される
    func placeholder(in context: Context) -> ReminderWidgetEntry {
        ReminderWidgetEntry(reminderCount: 2) // リマインダー数を2でセット
    }
    
    // スナップショットを取得するための関数。ここではリマインダーの数を4でセット
    func getSnapshot(in context: Context, completion: @escaping (ReminderWidgetEntry) -> Void) {
        completion(ReminderWidgetEntry(reminderCount: 4)) // スナップショットのエントリを完成してコールバックに渡す
    }
    
    // タイムラインを取得するための関数
    func getTimeline(in context: Context, completion: @escaping (Timeline<ReminderWidgetEntry>) -> Void) {
        let entry = ReminderWidgetEntry(reminderCount: getData()) // 現在のリマインダー数でエントリを作成
        // ウィジェットを手動で再ロードするため、再読み込みポリシーを.neverに設定
        completion(Timeline(entries: [entry], policy: .never)) // タイムラインを完成してコールバックに渡す
    }
    
    // UserDefaultsからリマインダーの数を取得するためのメソッド。App Groupsを利用してデータを共有
    func getData() -> Int{
        // UserDefaultsのインスタンスを作成。suiteNameにはApp Groupの名前を指定
        ///suiteNameを使用することで、ウィジェットとホストアプリ間でUserDefaultsのデータを共有が可能になる
        let defaults = UserDefaults(suiteName: ReminderAppConstants.appGroupName)
        // UserDefaultsからリマインダーの数を取得。取得できない場合は0を返す
        let count = defaults?.value(forKey: ReminderAppConstants.storageKey) as? Int ?? 0
        print("countは", count)
        return count
    }
}
