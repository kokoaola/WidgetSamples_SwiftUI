//
//  WeatherService.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import Foundation

struct WeatherService{
    func getWeather() async throws -> [Weather]{
        let urlString = "https://api.lil.software/weather?latitude=40.71302914226243&longitude=-74.00606120853008"
        // urlStringからURLを作成、urlStringが無効な場合はクラッシュ
        guard let url = URL(string: urlString)else{
            fatalError("Missing URL")
        }
        
        // URLSessionを使用してデータを非同期に取得、ネットワークエラー等で失敗したらエラーがthrowされる
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // HTTPのステータスコード(下記参照)が200か確認、それ以外はクラッシュ
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            fatalError("Error while fetching data")
        }
        
        // 取得したデータをDecodableを用いてWeatherResponseオブジェクトにデコード
        // デコードに失敗したらエラーがthrowされる
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        // 天気予報のリストを返す
        return weatherResponse.forecast
    }
}


/*
 HTTPステータスコード
 HTTP（Hypertext Transfer Protocol、ウェブページなどのリソースの転送に使われるプロトコル）で、サーバーからクライアントへレスポンスと共に送られる3桁の数字のコード
リクエストが成功したのか、エラーが発生したのか、その他の情報が通知する
 
 主なHTTPステータスコード：
 200 OK：リクエストが成功し、レスポンスとともに要求された情報が送られる
 201 Created：リクエストが成功し、新たなリソースが作成された
 400 Bad Request：リクエストが無効または不正
 401 Unauthorized：認証が必要
 403 Forbidden：サーバーがリクエストを理解したが、それを実行する権限がない
 404 Not Found：リクエストされたリソースが見つかりませんでした
 500 Internal Server Error：サーバー内部でエラーが発生した
 */
