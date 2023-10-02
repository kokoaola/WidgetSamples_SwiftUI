//
//  ExchangeRateTimelineProvider.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/01.
//

import SwiftUI
import WidgetKit


struct ExchangeRateTimelineProvider: TimelineProvider{
    typealias Entry = ExchangeRateEntry
    
    func placeholder(in context: Context) -> ExchangeRateEntry {
        ExchangeRateEntry(country: Country.sample, widgetFamily: context.family)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ExchangeRateEntry) -> Void) {
        completion(ExchangeRateEntry(country: Country.sample, widgetFamily: context.family))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ExchangeRateEntry>) -> Void) {
        let entry = ExchangeRateEntry(country: Country.sample, widgetFamily: context.family)
        completion(Timeline(entries: [entry], policy: .never))
    }
}
