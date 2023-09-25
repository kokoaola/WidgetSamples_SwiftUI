//
//  HelloWidjetEntry.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/22.
//

///追加のウィジェット
import Foundation
import WidgetKit

//TimeLineEntryプロトコルに準拠させる
struct HelloWidgetEntry: TimelineEntry {
    //タイムライン エントリ プロトコルのはdateプロパティが必須
    //ウィジェットをいつ更新する必要があるかを知るためにウィジェットに必要なプロパティ
    var date: Date
}
