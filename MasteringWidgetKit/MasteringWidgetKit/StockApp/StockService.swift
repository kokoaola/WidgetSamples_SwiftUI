//
//  StockService.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/01.
//

import SwiftUI
import WidgetKit

///APIエンドポイントを呼び出してJSON応答を取得するサービス構造体、関数
///ウィジェットでも使用するためターゲットはAPPとウィジェット両方
///w
struct StockService {
    // 外部からインスタンスを作成せずに直接呼び出せる静的関数
    static func getStockData(for symbol: String) async throws -> Stock {
        // URL文字列を作成し、URLインスタンスを取得。不正なURLの場合はクラッシュさせる
        guard let url = URL(string: "https://api.lil.software/stocks?symbol=\(symbol)") else {
            fatalError("Invalid URL")
        }
        
        // URLSessionを使用して非同期にデータとレスポンスを取得
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // レスポンスをHTTPURLResponseにキャストし、ステータスコードが200であることを確認。そうでない場合はクラッシュさせる
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            fatalError("Invalid response")
        }
        
        // 取得したデータをStock型にデコード。デコードに失敗するとエラーがthrowされる
        return try JSONDecoder().decode(Stock.self, from: data)
    }
}

