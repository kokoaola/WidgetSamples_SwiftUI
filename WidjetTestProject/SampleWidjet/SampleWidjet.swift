//
//  SampleWidjet.swift
//  SampleWidjet
//
//  Created by koala panda on 2023/09/21.
//

import WidgetKit
import SwiftUI

// WidgetKit and SwiftUIのフレームワークをインポート
import WidgetKit
import SwiftUI

///1.
/// タイムラインプロバイダ:ウィジェットを更新するために使用されるプロバイダー
/// ウィジェットを更新するタイミングを取得し、プロバイダーからタイムラインを要求する
/// タイムライン プロバイダーは基本的に、タイムライン エントリ プロトコルに準拠したタイムライン オブジェクトの配列を提供します。
struct Provider: TimelineProvider {
    typealias Entry = SimpleEntry
    
    /// ウィジェットのプレースホルダビューを提供するための関数。
    /// 基本的にローディング中の表示。
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    /// ウィジェットのスナップショット(瞬間の状態)を取得する関数
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    /// ウィジェット ビューで使用されるデータのソース
    //この例では、現在時刻から5時間後までのエントリを作成。
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // 現在の日付から5つのエントリを1時間ごとに生成。
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        // タイムラインを作成して完了ハンドラに渡す。
        //entries: entries: これは、ウィジェットに表示するデータの配列です。この例では、現在の時間から5時間後までの時間を1時間ごとに持つentries配列がこの引数として渡されます。
    //policy: .atEnd: これは、ウィジェットが自動的に更新されるタイミングを制御するためのポリシーです。.atEndポリシーは、タイムラインの最後のエントリが表示されたときにウィジェットを更新します。
        let timeline = Timeline(entries: entries, policy: .atEnd)
        //completion(timeline): これは、作成したタイムラインをシステムに渡します。completionは、getTimeline(in:completion:)メソッドの引数で、クロージャです。このクロージャを呼び出すことで、Timelineオブジェクトがシステムに渡され、システムはこのタイムラインに基づいてウィジェットを更新します。
        completion(timeline)
    }
}


///2.
/// タイムラインエントリーはウィジェットを表示する日付を指定する
/// ウィジェットに何を表示するかのデータ構造体
struct SimpleEntry: TimelineEntry {
    let date: Date
    //relevence（オプション）はデフォルトのnilになってる
}



///3.
/// エントリービュー：実際に表示するウィジェットの主要なビューを定義
/// ボタンやリスト、スライダーのようなものをビューに配置することはできない
struct SampleWidjetEntryView : View {
   // TimelineProviderプロトコルに準拠する構造体で、Entryはその中でTimelineEntryプロトコルに準拠した型で定義されています。この場合、SimpleEntryがそのEntry型として定義されており、一つのdateプロパティを持っています。
    //var entry: Provider.Entry
    //これでもOK
    var entry: SimpleEntry
    
    // ビューの本体部分。日付を時間形式で表示。
    var body: some View {
        Circle()
//        Text(entry.date, style: .time)
    }
}


///4.
/// ウィジェットの定義
/// 説明を書く
struct SampleWidjet: Widget {
    let kind: String = "SampleWidjet"
    
    // ウィジェットの設定。
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SampleWidjetEntryView(entry: entry)
        }
        // ウィジェットの名前と説明。
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}




/// プレビュープロバイダ。デザイン時にInterface Builderでウィジェットの見た目をプレビューするためのもの。
struct SampleWidjet_Previews: PreviewProvider {
    static var previews: some View {
        SampleWidjetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
