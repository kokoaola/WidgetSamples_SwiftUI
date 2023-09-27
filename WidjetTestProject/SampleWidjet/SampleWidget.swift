//
//  SampleWidjet.swift
//  SampleWidjet
//
//  Created by koala panda on 2023/09/21.
//

///このファイルはWidjetKitExtensionを選ぶと自動で作成されます
import WidgetKit
import SwiftUI


///1.タイムラインプロバイダ
/// ウィジェットを更新するために使用されるプロバイダー
/// ウィジェットを更新するタイミングを取得し、プロバイダーからタイムラインを要求する
/// タイムライン プロバイダーは基本的に、タイムライン エントリ プロトコルに準拠したタイムライン オブジェクトの配列を提供する

struct Provider: TimelineProvider {
    typealias Entry = SimpleEntry
    
    /// 1-1
    /// ローディング中のプレースホルダーを表示するエントリを生成
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    /// 1-2
    /// クイックルック（ユーザーが選択するときのメニュー）で表示するエントリを生成
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    /// 1-3
    /// ウィジェットビューで使用されるデータのソース
    ///3つのうち一番大切で、いつどのようにウィジェットを更新するか設定する
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        /// 現在の日付から5つのエントリを1時間ごとに生成
        // 現在の日付と時間を取得
        let currentDate = Date()
        // ウィジェットに表示するタイムラインのエントリ配列を作成
        var entries: [SimpleEntry] = []
        // １時間ずつ間隔をあけて、5つのエントリを作成
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        // タイムラインを作成して完了ハンドラに渡す
        //entries: ウィジェットに表示するデータの配列
        //policy:ウィジェットが自動的に更新されるタイミングを制御する
        //.atEndポリシーは、タイムラインの最後のエントリが表示された時ウィジェットを更新
        let timeline = Timeline(entries: entries, policy: .atEnd)
        //completion(timeline): 作成したタイムラインをシステムに渡すメソッド
        //システムはこのタイムラインに基づいてウィジェットを更新する
        completion(timeline)
    }
}







///2.タイムラインエントリー
/// ウィジェットに何を表示するかのデータ構造体
struct SimpleEntry: TimelineEntry {
    let date: Date
    //relevence（オプション）はデフォルトのnilになってる
}








///3.エントリービュー
/// 実際に表示するウィジェットの主要なビューを定義
/// ボタンやリスト、スライダーのようなものをビューに配置することはできない
struct SampleWidjetEntryView : View {
   // TimelineProviderプロトコルに準拠する構造体で、Entryはその中でTimelineEntryプロトコルに準拠した型で定義されています。この場合、SimpleEntryがそのEntry型として定義されており、一つのdateプロパティを持っています。
    //var entry: Provider.Entry
    //これでもOK
    var entry: SimpleEntry
    
    // ビューの本体部分。日付を時間形式で表示。
    var body: some View {
        Circle()
            .padding()
//        Text(entry.date, style: .time)
    }
}









///4.Widget構造体
///上の３つの構造体のバインディングと、サイズ・説明・表示名を提供する
///Bundleに入れるのはこれ
struct SampleWidjet: Widget {
    //kindは現在のプロジェクトのコンテキスト内でウィジェットを一意に識別する文字列値
    let kind: String = "SampleWidjet"
    
    // ウィジェットの設定をする部分
    var body: some WidgetConfiguration {
        //StaticConfigurationは、ウィジェットがシステムに登録される方法や、ウィジェットがどのように更新されるかを定義する
        //ユーザーが選んだものを表示させる時はここをIntentConfigrationに変更
        
        //kindパラメータは、ウィジェットの一意の識別子で、ウィジェットのタイプをシステムに知らせる
        //providerパラメータは、ウィジェットのTimelineProviderを指定して、ウィジェットの表示内容や更新タイミングを管理する
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            //クロージャで具体的なViewをどのように表示するかを定義する。ここでのentryは、QuoteTimeLineProviderが提供するTimelineEntryのインスタンス。このentryをベースにQuotesWidgetViewが描画される
            SampleWidjetEntryView(entry: entry)
        }
        // ウィジェットギャラリーで表示させる名前を設定
        .configurationDisplayName("My Widget")
        // ウィジェット説明を設定
        .description("This is an example widget.")
    }
}








/// プレビュープロバイダ。デザイン時にInterface Builderでウィジェットの見た目をプレビューするためのもの。

struct SampleWidjet_Previews: PreviewProvider {
    static var previews: some View {
        //指定した日付のウィジェットを表示させる
        SampleWidjetEntryView(entry: SimpleEntry(date: Date()))
        //familydでサイズを指定できる
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        SampleWidjetEntryView(entry: SimpleEntry(date: Date()))
        //familydでサイズを指定できる
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
