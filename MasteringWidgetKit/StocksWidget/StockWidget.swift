//
//  StockWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/02.
//

import SwiftUI
import WidgetKit

struct StockWidget: Widget{
    var body: some WidgetConfiguration{
        IntentConfiguration(kind: "guntama.guntama.StockWidget", intent: StockConfigrationIntent.self, provider: StockTimelineProvider()) { entry in
            StockWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Configrable Stock Widget")
        .description("Stock widget with configrable options")
    }
}

/*
このファイル内で定義した各Intentには、固有の識別子があります。これらの識別子をIntentsSupportedキーの配列値としてInfo.plistに追加する必要があります。

識別子の調べ方
Xcodeでプロジェクトを開く
Xcodeで対象のプロジェクトを開きます。

    .intentdefinitionファイルを探す
プロジェクトナビゲータで、.intentdefinitionファイルを探します。これは通常、プロジェクトの主要なディレクトリに配置されます。

Intentの識別子を確認する
    .intentdefinitionファイルを開くと、ファイル内で定義されている各Intentを見ることができます。各Intentの名前が、その識別子です。

Info.plistに追加
調べたIntentの識別子を、Siri Intents App ExtensionのInfo.plistファイルのIntentsSupportedキーの配列値として追加します。

具体的には、NSExtensionセクションのNSExtensionAttributesディクショナリにIntentsSupportedキーを追加し、その値としてサポートするIntentの識別子の文字列の配列を設定します。

 */
