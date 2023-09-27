//
//  WorkoutTimelineProvider.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI
import WidgetKit

struct WorkoutTimelineProvider: TimelineProvider{
    // エントリータイプをWorkoutEntryに設定
    typealias Entry = WorkoutEntry
    
    // サンプルワークアウトデータをセット
    private let workoutData = Workout.sample
    
    // プレースホルダーとして表示するエントリを生成
    func placeholder(in context: Context) -> WorkoutEntry {
        WorkoutEntry(date: Date(), workoutDate: workoutData, widgetFamily: context.family)
    }
    
    // スナップショットを生成
    // デベロッパがウィジェットのプレビューを見るときや、
    // ウィジェットのロード中に表示するデータ
    func getSnapshot(in context: Context, completion: @escaping (WorkoutEntry) -> Void) {
        // スナップショットエントリを完成してコールバックに渡す
        completion(WorkoutEntry(date: Date(), workoutDate: workoutData, widgetFamily: context.family))
    }
    
    // タイムラインを生成
    func getTimeline(in context: Context, completion: @escaping (Timeline<WorkoutEntry>) -> Void) {
        let currentDate = Date() // 現在の日付を取得
        // エントリを生成。エントリはウィジェットに表示するデータの単位。
        let entry = WorkoutEntry(date: currentDate, workoutDate: workoutData, widgetFamily: context.family)
        // タイムラインが再読み込みされる時刻を設定。ここでは現在時刻から1分後。
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate)!
        // タイムラインを完成してコールバックに渡す。policyにはタイムラインの再読み込みのポリシーを設定。
        completion(Timeline(entries: [entry], policy: .after(refreshDate)))
    }
}
