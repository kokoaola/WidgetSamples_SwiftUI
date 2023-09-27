//
//  WeatherEntry.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI
import WidgetKit

struct WeatherEntry: TimelineEntry{
    let date: Date
    let weather: [Weather]
}
