//
//  StockWidgetEntryView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/02.
//

import SwiftUI
import WidgetKit


struct StockWidgetEntryView: View {
    var entry: StockSymbolEntry
    
    var body: some View {
        VStack{
            if let stock = entry.stock{
                Text(stock.name)
                    .bold()
                
                Spacer()
                
                Text(stock.current.formatted(.currency(code: "USD")))
                    .font(.title2.bold())
                    .foregroundStyle(stock.current < stock.previousClose ? Color.red.gradient : Color.green.gradient)
                
                Text("Prev close: \(stock.previousClose.formatted(.currency(code: "USD")))")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
                Spacer()
            }else{
                Text("Choose a stock symbol from configuration.")
            }
        }
    }
}





