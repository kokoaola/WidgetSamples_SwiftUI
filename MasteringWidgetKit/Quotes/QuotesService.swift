//
//  QuotesService.swift
//  SampleWidgetExtension
//
//  Created by koala panda on 2023/09/25.
//

import Foundation

struct QuotesService{
    // 引用文を非同期に取得する関数
    func getQuotes() async throws -> Quote{
        // APIのエンドポイントURL
        let urlString = "https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en"
        
        // URLオブジェクトの生成。変換できない場合はクラッシュさせる
        guard let url = URL(string: urlString) else{
            fatalError("Missing URL.")
        }
        
        // URLからデータを非同期に取得
        let (data,response) = try await URLSession.shared.data(from: url)
        
        // ステータスコードのチェック。200以外はクラッシュさせる
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            fatalError("Error while fetching data")
        }
        
        // 取得したデータをQuoteオブジェクトにデコード
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        // デコードされたQuoteオブジェクトを返す
        return quote
    }
}
