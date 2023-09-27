//
//  Weather.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import Foundation

///ネストの内側の型
struct Weather: Codable {
    let name: String
    let temperature: Int
    let unit: String
    let description: String
}
