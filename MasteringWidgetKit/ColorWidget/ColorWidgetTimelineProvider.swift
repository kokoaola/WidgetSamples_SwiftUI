//
//  ColorWidgetTimelineProvider.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/28.
//

import SwiftUI
import WidgetKit


// `ColorWidgetTimelineProvider`は、ウィジェットの内容を提供するためのTimelineProviderを実装する構造体
struct ColorWidgetTimelineProvider:IntentTimelineProvider{
    // `ColorEntry`をエントリータイプとして使うことを宣言
    typealias Entry = ColorEntry
    // `ColorSelectionIntentIntent`をインテントタイプとして使うことを宣言
    typealias Intent = ColorSelectionIntentIntent
    
    // プレースホルダとして表示するウィジェットの内容を提供（ウィジェットのプレビュー表示時などに使用）
    func placeholder(in context: Context) -> ColorEntry {
        // プレースホルダとして、背景色がオレンジのエントリを返す
        return ColorEntry(backColor: .orange)
    }
    
    // ウィジェットのスナップショット（瞬時の状態）を提供
    func getSnapshot(for configuration: ColorSelectionIntentIntent, in context: Context, completion: @escaping (ColorEntry) -> Void) {
        // スナップショットとして、背景色がオレンジのエントリを返す
        completion(ColorEntry(backColor: .orange))
    }
    
    // ウィジェットのタイムライン（一連のエントリ）を提供
    func getTimeline(for configuration: ColorSelectionIntentIntent, in context: Context, completion: @escaping (Timeline<ColorEntry>) -> Void) {
        // タイムラインとして、設定から取得した背景色を持つエントリのタイムラインを返す
        // ここではpolicyが.neverなので、このタイムラインは更新されない
        completion(Timeline(entries: [ColorEntry(backColor: configuration.backColor)], policy: .never))
    }
}
