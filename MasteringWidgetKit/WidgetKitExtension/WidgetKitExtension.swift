//
//  WidgetKitExtension.swift
//  WidgetKitExtension
//
//  Created by koala panda on 2023/09/27.
//

///このファイルはWidjetKitExtensionを選ぶと自動で作成されます
import WidgetKit
import SwiftUI


///1.
/// タイムラインプロバイダ:ウィジェットを更新するために使用されるプロバイダー
/// ウィジェットを更新するタイミングを取得し、プロバイダーからタイムラインを要求する
/// タイムライン プロバイダーは基本的に、タイムライン エントリ プロトコルに準拠したタイムライン オブジェクトの配列を提供する
/// TimelineProviderは、先生のようなもの。先生は、授業の計画を作って、どの時間にどの授業をするかを決めます。TimelineProviderも同じで、ウィジェットの「授業計画」を作ります。つまり、どの時点でウィジェットが何を表示するかを決めてくれるんです。
struct Provider: TimelineProvider {
    typealias Entry = WidgetKitExtensionEntry
    
    /// 1-1ウィジェットのプレースホルダビューを提供するための関数。
    /// 基本的にローディング中の表示。
    func placeholder(in context: Context) -> WidgetKitExtensionEntry {
        WidgetKitExtensionEntry(date: Date())
    }
    
    /// 1-2ウィジェットのスナップショット(瞬間の状態)を取得する関数
    func getSnapshot(in context: Context, completion: @escaping (WidgetKitExtensionEntry) -> ()) {
        let entry = WidgetKitExtensionEntry(date: Date())
        completion(entry)
    }
    
    /// 1-3ウィジェット ビューで使用されるデータのソース
    //3つのうち一番大切
    //いつどのようにウィジェットを更新するか設定する
    //この例では、現在時刻から5時間後までのエントリを作成。
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [WidgetKitExtensionEntry] = []
        
        // 現在の日付から5つのエントリを1時間ごとに生成。
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = WidgetKitExtensionEntry(date: entryDate)
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
/// TimelineEntryは、授業計画の中の一つ一つの授業の内容です。たとえば、「算数の時間には足し算を学ぶ」というのが一つの授業内容ですね。TimelineEntryも同じで、ウィジェットが表示する一つ一つの「内容」や「状態」を表します。
struct WidgetKitExtensionEntry: TimelineEntry {
    let date: Date
    //relevence（オプション）はデフォルトのnilになってる
}



///3.
/// エントリービュー：実際に表示するウィジェットの主要なビューを定義
/// ボタンやリスト、スライダーのようなものをビューに配置することはできない
struct WidgetKitExtension : View {
    // TimelineProviderプロトコルに準拠する構造体で、Entryはその中でTimelineEntryプロトコルに準拠した型で定義されています。この場合、SimpleEntryがそのEntry型として定義されており、一つのdateプロパティを持っています。
    //var entry: Provider.Entry
    //これでもOK
    var entry: WidgetKitExtensionEntry
    
    // ビューの本体部分。日付を時間形式で表示。
    var body: some View {
        Circle()
            .padding()
        //        Text(entry.date, style: .time)
    }
}


///4.
///Widgetプロトコルは上の構造体のバインディングを行う
struct WidgetKitExtensionWidjet: Widget {
    //kindは現在のプロジェクトのコンテキスト内でウィジェットを一意に識別する文字列値
    let kind: String = "SampleWidjet"
    
    // ウィジェットの設定をする部分
    var body: some WidgetConfiguration {
        //ユーザーが選んだものを表示させる時はここをIntentConfigrationに変更
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            // ここでentryを使用してSampleWidjetEntryViewを作成・設定
            // entryはProviderから提供されたTimelineEntryのインスタンス
            WidgetKitExtension(entry: entry)
        }
        // ウィジェットギャラリーで表示させる名前を設定
        .configurationDisplayName("My Widget")
        // ウィジェット説明を設定
        .description("This is an example widget.")
    }
}




/// プレビュープロバイダ。デザイン時にInterface Builderでウィジェットの見た目をプレビューするためのもの。

struct WidgetKitExtension_Previews: PreviewProvider {
    static var previews: some View {
        //指定した日付のウィジェットを表示させる
        WidgetKitExtension(entry: WidgetKitExtensionEntry(date: Date()))
        //familydでサイズを指定できる
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        WidgetKitExtension(entry: WidgetKitExtensionEntry(date: Date()))
        //familydでサイズを指定できる
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
