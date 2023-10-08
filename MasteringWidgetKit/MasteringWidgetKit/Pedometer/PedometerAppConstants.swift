//
//  File.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/02.
//

import SwiftUI
import WidgetKit
///
///アプリ全体で使用する定数をまとめたファイル
///

struct PedometerAppConstants{
    // 歩数の保存用のキー
    static var stepsStorageKey = "totalSteps"
    
    // App Extensionとのデータ共有を可能にするApp Groupの名前
    static var appGroupName = "group.amatnug.amatnug.GroupForWidget"
    
    // Widgetの種類を一意に識別するための文字列
    static var widgetKind = "amatnug.amatnug.PedometerWidget"
    
    // Widgetのタイムラインをリロードするための関数 更新
    static func reloadPedometerTimelines(){
        // WidgetCenterを使用して、指定したkindのWidgetのタイムラインをリロード
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
