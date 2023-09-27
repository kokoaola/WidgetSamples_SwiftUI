//
//  WeatherConstants.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import Foundation

///プレビュー用のサンプル
struct WeatherConstants{
    static var snapshotWeatherInfo: [Weather]{
        var weatherInfo = [Weather]()
        
        for i in 0...9{
            let weather = Weather(name: "Day \(i + 1)", temperature: 10, unit: "F", description: "Cloudy")
            weatherInfo.append(weather)
        }
        return weatherInfo
    }
}
