//
//  GroceryEntry.swift
//  CoredataAndWidgetExtensionExtension
//
//  Created by koala panda on 2023/09/28.
//

import SwiftUI
import WidgetKit

// TimelineEntryを採用するGroceryEntry構造体を定義
struct GroceryEntry: TimelineEntry{
    // TimelineEntryが必要とするdateプロパティを持つ、これはエントリが表す日時
    let date = Date()
    // Itemオブジェクトの配列を持つ、これがGroceryのアイテム
    var items = [Item]()
}
