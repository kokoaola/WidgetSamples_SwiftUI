//
//  ExchangeRateEntry.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/01.
//

import WidgetKit


struct ExchangeRateEntry: TimelineEntry{
    let date = Date()
    let country: [Country]
    let widgetFamily: WidgetFamily
}
