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
        StockWidget()
        ExchangeRateWidget()
        ExpenseWidget()
        ColorWidget()
        TodayWidget()
        QuotesWidget()
        PhotoWidget()
        WeatherWidget()
        WorkoutWidget()
        WidgetKitExtensionSubbundle().body
    }
}

///数が増えすぎたのでいくつかサブバンドルへ移す
struct WidgetKitExtensionSubbundle: WidgetBundle {
    var body: some Widget {
        ReminderWidget()
        HelloStaticWidget()
    }
}
