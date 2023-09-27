//
//  WeatherWidgetView.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI
import WidgetKit

struct WeatherWidgetView: View {
    var entry: WeatherEntry
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            WeatherView.init(weater: entry.weather[0], updateDate: entry.date, backColor: .orange, showDate: true)
            
        case .systemMedium:
            HStack(spacing:0){
                WeatherView.init(weater: entry.weather[0], updateDate: entry.date, backColor: .orange, showDate: false)
                WeatherView.init(weater: entry.weather[1], updateDate: entry.date, backColor: .indigo, showDate: true)
            }
            
        case .systemLarge:
            VStack{
                HStack(spacing:0){
                    WeatherView.init(weater: entry.weather[0], updateDate: entry.date, backColor: .orange, showDate: false)
                    WeatherView.init(weater: entry.weather[1], updateDate: entry.date, backColor: .indigo, showDate: true)
                }
                HStack(spacing: 40) {
                    VStack(spacing: 0) {
                        DailyWeaterView(weather: entry.weather[2])
                        DailyWeaterView(weather: entry.weather[3])
                    }
                    VStack(spacing: 0) {
                        DailyWeaterView(weather: entry.weather[4])
                        DailyWeaterView(weather: entry.weather[5])
                    }
                    VStack(spacing: 0) {
                        DailyWeaterView(weather: entry.weather[6])
                        DailyWeaterView(weather: entry.weather[7])
                    }
                    VStack(spacing: 0) {
                        DailyWeaterView(weather: entry.weather[8])
                        DailyWeaterView(weather: entry.weather[9])
                    }
                }
            }

            
        default:
            Text("We should never reach here.")
        }
    }
}

struct WeatherWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidgetView(entry: WeatherEntry(date: Date(), weather: WeatherConstants.snapshotWeatherInfo))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        WeatherWidgetView(entry: WeatherEntry(date: Date(), weather: WeatherConstants.snapshotWeatherInfo))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
        WeatherWidgetView(entry: WeatherEntry(date: Date(), weather: WeatherConstants.snapshotWeatherInfo))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
