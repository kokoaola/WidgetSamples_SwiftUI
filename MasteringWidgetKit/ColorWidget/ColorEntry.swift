//
//  ColorEntry.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/28.
//

import SwiftUI
import WidgetKit

struct ColorEntry: TimelineEntry{
    let date = Date()
    //インテント定義ファイルで定義した列挙体を指定
    var backColor: ColorSelection
}
