//
//  FocusTimerAttributes.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/03.
//

import ActivityKit
import SwiftUI
///アプリとウィジェットで共有されるライブアクティビティの動的データに関連する構造体を定義
///
//ライブ アクティビティの動的データのサイズは 4 キロバイトを超えることはできません

// フォーカスタイマーの属性を定義する構造体
struct FocusTimerAttributes: ActivityAttributes{
    // タイマーの名前
    var timerName: String
    
    // タイマーのコンテンツ状態を定義する構造体
    public struct ContentState: Codable, Hashable{
        // タイマーが終了する時間
        var endTime: Date
    }
}
