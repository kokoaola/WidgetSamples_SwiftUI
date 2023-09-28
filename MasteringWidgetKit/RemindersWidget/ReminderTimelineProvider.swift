//
//  ReminderTimelineProvider.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI
import WidgetKit

struct ReminderTimelineProvider: TimelineProvider{
    
    typealias Entry = ReminderWidgetEntry
    
    func placeholder(in context: Context) -> ReminderWidgetEntry {
        ReminderWidgetEntry(reminderCount: 2)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ReminderWidgetEntry) -> Void) {
        completion(ReminderWidgetEntry(reminderCount: 4))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ReminderWidgetEntry>) -> Void) {
        let entry = ReminderWidgetEntry(reminderCount: 0)
        //ウィジェットをプログラムで再ロードするために.neverを指定
        completion(Timeline(entries: [entry], policy: .never))
    }
    

    
}
