//
//  WidgetKitExtensionBundle.swift
//  WidgetKitExtension
//
//  Created by koala panda on 2023/09/27.
//

import WidgetKit
import SwiftUI

@main
struct WidgetKitExtensionBundle: WidgetBundle {
    var body: some Widget {
        HelloStaticWidget()
        TodayWidget()
        QuotesWidget()
        PhotoWidget()
        WeatherWidget()
        WorkoutWidget()
        ReminderWidget()
        
    }
}
