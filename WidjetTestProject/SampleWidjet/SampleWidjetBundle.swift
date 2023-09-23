//
//  SampleWidjetBundle.swift
//  SampleWidjet
//
//  Created by koala panda on 2023/09/21.
//

import WidgetKit
import SwiftUI

@main
struct SampleWidjetBundle: WidgetBundle {
    var body: some Widget {
        ///２種類のウィジェット（３サイズ）が選べるようになる
//        SampleWidjet()
        HelloStaticWidget()
        TodayWidget()
    }
}
