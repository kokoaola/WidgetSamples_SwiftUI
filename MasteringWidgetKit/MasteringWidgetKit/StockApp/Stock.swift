//
//  Stock.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/01.
//

import Foundation

struct Stock: Codable{
    //Swiftのプロパティ名ではアンダースコアは推奨されていないため、元のprevious_closeではなくpreviousCloseという名前を使用したい
    let stockOpen, high, low, current, previousClose: Double
    let name: String
    
    //SWIFTの予約語と競合する名前の時などにも使用できる
    ///CodingKeyを使用する理由
    ///1. キーのマッピング（JSONのキー名と、モデルのプロパティ名が異なる場合）:
    ///JSONのキー名とモデルのプロパティ名が異なる場合でも、デコードやエンコードを正しく機能させる
    ///2. キーの除外
    ///デコードすべきでない一部のキーを除外する場合、CodingKeysを利用して、デコードするキーだけを列挙することで、列挙に含まれないキーはデコード時に無視される
    enum CodingKeys: String, CodingKey{
        case stockOpen = "open"
        case high, low, current
        case previousClose = "previous_close"
        case name
    }
}


/*
 元のJSON
 {
 "open":172.02,
 "high":173.07,
 "low":170.341,
 "current":171.21,
 "previous_close":170.69,
 "name":"Apple Inc"
 }
 */
