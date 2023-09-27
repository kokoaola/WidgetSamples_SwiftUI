//
//  SampleWidjetBundle.swift
//  SampleWidjet
//
//  Created by koala panda on 2023/09/21.
//

import WidgetKit
import SwiftUI

@main
///プロジェクトで使用したいウィジェット構造体を指定する
struct SampleWidjetBundle: WidgetBundle {
    var body: some Widget {
//        SampleWidjet()
        HelloStaticWidget()
        TodayWidget()
        QuotesWidget()
        PhotoWidget()
        WeatherWidget()
    }
}
