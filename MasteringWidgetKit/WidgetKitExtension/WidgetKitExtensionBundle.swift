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
        FamousPlaceMapWidget()
        PedometerWidget()
        StockWidget()
        ExchangeRateWidget()
        ExpenseWidget()
        ColorWidget()
        TodayWidget()
        QuotesWidget()
        WidgetKitExtensionSubbundle().body
    }
}

///数が増えすぎたのでいくつかサブバンドルへ移す
struct WidgetKitExtensionSubbundle: WidgetBundle {
    var body: some Widget {
        PhotoWidget()
        WeatherWidget()
        WorkoutWidget()
        ReminderWidget()
        HelloStaticWidget()
        if #available(iOS 16.1, *){
            FocusTimerLiveWidget()
        }
    }
}
