//
//  Qoute.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/25.
//

import Foundation
///APIを使ったWidget

///JSON用の型
struct Quote: Codable{
    //引用本文と著者名を格納する変数
    let quoteText, quoteAuthor: String
}
