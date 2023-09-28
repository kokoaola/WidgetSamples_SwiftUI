//
//  GroceryConstants.swift
//  CoreDataAndWidget
//
//  Created by koala panda on 2023/09/28.
//

import Foundation
import SwiftUI
import WidgetKit


///このアプリ内のさまざまな場所で使用される定数をまとめたファイル

struct GroceryConstants{
    // App Groupを利用するためのコンテナURLを取得。ここで指定するIDはApp Groupsで設定したもの
    static let appGroupContainerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.CoreDataAndWidgetGroup")!
    
    // red, green, blueの値をランダムに生成してColorを返す。表示色をランダムにする場合などに使用
    static var randomColor: Color{
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
    
    // ウィジェットの識別子。これを利用してウィジェットのタイムラインをリロードする
    static var widgetKind = "amatnug.amatnug.GroceryWidget"
    
    // WidgetCenterを通じて、特定のウィジェットのタイムラインをリロードする。アプリ内でデータ変更があった時などに呼ぶ
    static func reloadGroceryTimelines(){
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
