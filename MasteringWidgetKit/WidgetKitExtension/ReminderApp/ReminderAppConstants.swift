//
//  ReminderAppConstants.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/09/27.
//

///ターゲットはプロジェクトとエクステンション両方
///アプリとウィジェットの両方によって参照されるストレージキーを入れておく
import WidgetKit

struct ReminderAppConstants{
    static var storageKey = "totalReminders"
    static var appGroupName = "group.amatnug.amatnug.GroupForWidget"
    
    static var widgetKind = "amatnug.amatnug.ReminderWidget"
    
    static func reloadReminderTimelines(){
        //このアプリを含むアプリに属する​​ウィジェットすべてのタイムラインをリロード.reloadAllTimelines()
        //特定のウィジェットのタイムラインをリロード.reloadTimelines(ofKind: )
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
