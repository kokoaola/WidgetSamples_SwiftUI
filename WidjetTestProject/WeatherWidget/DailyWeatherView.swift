//
//  DailyWeatherView.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI

struct DailyWeaterView: View{
    let weather: Weather
    
    var body: some View{
        VStack(spacing: 0){
            Text(weather.name.lowercased().contains("night") ? "🌙":"🌞")
            Text("\(weather.temperature)°\(weather.unit)")
            Text(WeatherUtil.weatherIcon(by: weather.description))
        }
        .padding(5)
    }
}
