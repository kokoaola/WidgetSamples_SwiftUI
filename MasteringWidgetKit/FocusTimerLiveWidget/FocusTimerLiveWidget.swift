//
//  FocusTimerLiveWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/03.
//

import WidgetKit
import SwiftUI


// フォーカスタイマーのライブウィジェットを定義
struct FocusTimerLiveWidget: Widget{
    var body: some WidgetConfiguration{
        // フォーカスタイマーの属性に基づくアクティビティ設定
        ActivityConfiguration(for: FocusTimerAttributes.self) { context in
            FocusTimerEntryView(context: context)
        } dynamicIsland: { context in
            // ダイナミックアイランドの設定
            DynamicIsland{
                DynamicIslandExpandedRegion(.center) {
                    // センターにアラームのアイコンを表示
                    Image(systemName: "alarm")
                }
            } compactLeading: {
                // コンパクトなリーディング領域は空にする
                EmptyView()
            } compactTrailing: {
                // コンパクトなトレイリング領域は空にする
                EmptyView()
            } minimal: {
                // 最小限の領域は空にする
                EmptyView()
            }
        }
    }
}
