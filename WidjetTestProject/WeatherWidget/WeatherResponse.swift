//
//  WeatherResponse.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import Foundation


///ネストの外側の型
struct WeatherResponse: Codable{
    let forecast: [Weather]
}
