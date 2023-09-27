//
//  WeatherUtil.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//
import Foundation
///ヘルパー関数


struct WeatherUtil{
    // 指定された天気の状態文字列に基づいて適切なアイコン文字列を返す関数
    static func weatherIcon(by condition: String) -> String{
        // 引数で受け取った天気の状態文字列を小文字に変換してcurrentに代入
        let current = condition.lowercased()
        
        // currentの内容に基づいて適切なアイコンを返す
        switch current{
        case _ where current.contains("party sunny"):
            return "🌤"
        case _ where current.contains("light_rain"):
            return "☔️"
        case _ where current.contains("drizzle"):
            return "🌧"
        case _ where current.contains("sunny"):
            return "☀️"
        case _ where current.contains("clear"):
            return "😎"
        case _ where current.contains("fog"):
            return "🌫"
        case _ where current.contains("snow"):
            return "🌨"
        default:
            return "☁️"
        }
    }
}
