//
//  IntentHandler.swift
//  CustomStockIntent
//
//  Created by koala panda on 2023/10/02.
//

import Intents

//StockConfigrationIntentHandlingプロトコルは自動で生成されるので準拠させる
class IntentHandler: INExtension,StockConfigrationIntentHandling{
    
    //この関数を実装させる
    func provideCustomStockSymbolOptionsCollection(for intent: StockConfigrationIntent) async throws -> INObjectCollection<CustomStockSymbol> {
        let stocks: [CustomStockSymbol] = [
            .init(identifier: "MSFT", display: "Microsoft"),
            .init(identifier: "AAPL", display: "Apple"),
            .init(identifier: "RIVN", display: "Rivian"),
            .init(identifier: "AMNZ", display: "Amazon"),
            .init(identifier: "NFLX", display: "Netflix"),
            .init(identifier: "TWTR", display: "Twitter"),
            .init(identifier: "TWLO", display: "Twilio")
        ]
        
        let collection = INObjectCollection(items: stocks)
        return collection
    }
    
    // デフォルト値を設定する
    func defaultCustomStockSymbol(for intent: StockConfigrationIntent) -> CustomStockSymbol? {
        return .init(identifier: "AAPL", display: "Apple")
    }
}
