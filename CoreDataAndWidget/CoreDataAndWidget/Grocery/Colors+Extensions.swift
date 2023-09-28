//
//  Colors+Extensions.swift
//  CoreDataAndWidget
//
//  Created by koala panda on 2023/09/28.
//

import SwiftUI

///ランダムなカラーコードを作成する
///
///生成する時
///     let color = Color.randomHexColorCode
///Colorに戻す時
///     Color(hex: color ?? "#FF5733")

extension Color {
    // Color構造体を拡張して、16進数のカラーコードを初期化パラメータとして受け取れるようにする
    init(hex: String){
        // 引数で受け取った16進数文字列から、英数字以外を削除
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        // 削除した文字列を数値に変換
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        // 16進数文字列の長さに応じて、各色と透明度の値を設定
        switch hex.count {
        case 3: // #RGB
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // #RRGGBB
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // #AARRGGBB
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: // それ以外の場合、無効な値として全て1に設定（黒になる）
            (a, r, g, b) = (1, 1, 1, 0)
        }
        // 計算された値を基にColorインスタンスを生成
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    // 乱数を使ってランダムな16進数カラーコードを生成するプロパティ
    static var randomHexColorCode : String {
        let a = ["1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
        // #にランダムに選ばれた3つの16進数文字を追加してカラーコードを作成
        return "#".appending(a[Int.random(in:0..<15)]).appending(a[Int.random(in:0..<15)]).appending(a[Int.random(in:0..<15)])
    }
}
