//
//  ExchangeRateService.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/09/30.
//

import Foundation


// ExchangeRateService構造体。通貨の交換レートを取得するためのサービス
struct ExchangeRateService {
    // 非同期関数。指定された通貨の現在の交換レートを取得
    func getCurrentRate(from: String) async throws -> ExchangeRate {
//    func getCurrentRate(from: String, to: String, amount: Int) async throws -> ExchangeRate {
        // APIエンドポイントのURLを生成
        let urlString = "https://api.aoikujira.com/kawase/json/\(from)"
        //元のやつ、もう使えない
        //"https://api.exchangerate.host/convert?from=\(from)&to=\(to)&amount=\(amount)"
        // URLオブジェクトを生成。失敗したらクラッシュ
        guard let url = URL(string: urlString) else {
            fatalError("Missing URL")
        }
        // URLSessionを使用してデータとレスポンスを非同期に取得
        let (data, response) = try await URLSession.shared.data(from: url)
        // HTTPレスポンスのステータスコードが200でないならクラッシュ
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while fetching the data")
        }
        // 取得したデータをExchangeRate型にデコード。失敗したらエラーをスロー
        let rateResponse = try JSONDecoder().decode(ExchangeRate.self, from: data)
        // デコードされたExchangeRateオブジェクトを返す
        return rateResponse
    }
}

