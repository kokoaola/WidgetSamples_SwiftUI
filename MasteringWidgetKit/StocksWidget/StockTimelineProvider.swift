//
//  StockTimelineProvider.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/02.
//

import SwiftUI
import WidgetKit


struct StockTimelineProvider: IntentTimelineProvider{
    typealias Entry = StockSymbolEntry
    typealias Intent = StockConfigrationIntent
    
    func placeholder(in context: Context) -> StockSymbolEntry {
        StockSymbolEntry(date: Date(), configuration: StockConfigrationIntent(), stock: nil)
    }
    
    func getSnapshot(for configuration: StockConfigrationIntent, in context: Context, completion: @escaping (StockSymbolEntry) -> Void) {
        completion(StockSymbolEntry(date: Date(), configuration: StockConfigrationIntent(), stock: nil))
    }
    
    func getTimeline(for configuration: StockConfigrationIntent, in context: Context, completion: @escaping (Timeline<StockSymbolEntry>) -> Void) {
        Task{
            do{
                let stockData = try await StockService.getStockData(for: configuration.customStockSymbol?.identifier ?? "VTI")
                
                let timeline = Timeline(entries: [StockSymbolEntry(date: Date(), configuration: configuration, stock: stockData)], policy: .atEnd)
                completion(timeline)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
