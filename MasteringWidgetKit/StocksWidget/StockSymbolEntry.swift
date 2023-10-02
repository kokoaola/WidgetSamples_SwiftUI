//
//  StockSymbolEntry.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/02.
//

import SwiftUI
import WidgetKit


struct StockSymbolEntry: TimelineEntry{
    let date: Date
    let configuration: StockConfigrationIntent
    let stock: Stock?
}
