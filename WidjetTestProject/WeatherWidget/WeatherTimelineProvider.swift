//
//  WeatherTimelineProvider.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI
import WidgetKit

struct WeatherTimelineProvider: TimelineProvider{
    // WeatherEntryをタイムラインプロバイダが扱うエントリタイプとして定義
    typealias Entry = WeatherEntry
    
    // placeholderメソッドでプレースホルダーエントリを生成、主にローディング画面で表示
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(date: Date(), weather: WeatherConstants.snapshotWeatherInfo)
    }
    
    // getSnapshotメソッドでスナップショットエントリを生成、ウィジェットのプレビュー画面で使用
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        completion(WeatherEntry(date: Date(), weather: WeatherConstants.snapshotWeatherInfo))
    }
    
    // getTimelineメソッドでタイムラインを生成、これによりウィジェットのコンテンツが決まる
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        let currentDate = Date()
        // 現在の日時から15分後をリフレッシュ日時として設定
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        
        // WeatherServiceを使って天気情報を非同期に取得
        Task{
            do{
                // 天気情報を取得
                let weather = try await WeatherService().getWeather()
                // 取得した天気情報を元にエントリを生成
                let entry = WeatherEntry(date: currentDate, weather: weather)
                // エントリとリフレッシュ日時を元にタイムラインを生成
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                // タイムラインを完成させてcompletionハンドラに渡す
                completion(timeline)
            }catch{
                // エラーが発生した場合はエラーメッセージをログに出力
                print(error.localizedDescription)
            }
        }
    }
}
