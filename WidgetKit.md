# WidgetKit

## 最初の導入方法
1. プロジェクト選択してFile - New - Target - Widget Extension - Next - include configuration intentとlive activityはチェックを外す - 名前をつけてCreate - 新しいグループ内にウィジェット用のファイルが追加される

## 4つの主要な構造体
```Swift
/// タイムラインプロバイダ:ウィジェットの更新プロセスを駆動するために使用されるプロバイダー
/// ウィジェットを更新する
struct Provider: TimelineProvider {
}

/// タイムラインエントリーはウィジェットを表示する日付を指定する
/// ウィジェットに何を表示するかのデータ構造体
struct SimpleEntry: TimelineEntry {
}

/// 実際に表示するウィジェットの主要なビューを定義
struct SampleWidjetEntryView : View {
}

/// ウィジェットの定義
/// 説明を書く
struct SampleWidjet: Widget {
}
```


## ２つめ以降のウィジェットを１から自分で追加する（上の作業はしてあること前提で）
1. 新しいフォルダを作る
2. 作ったフォルダ内にファイルを作る(すべてTargetは導入手順で作ったウィジェットのエクステンションのみにチェックをいれる)
    - タイムラインエントリー用のXXXEntry.swiftファイルを追加
        1. XXXEntry構造体を作る
        2. dateプロパティ必須、あとは好きなの作る
    - タイムラインプロバイダー用のXXXTimelineProvider.swiftファイルを追加
        1. typealiasでXXXEntryを設定
        2. 必須関数３つスタブで実装
           - サンプルコードを参照
    - ウィジェットビュー用のXXXView.swiftファイルを追加（SwiftUI）
        1. entryプロパティを受け取るようにする
        2. ビューを書く
        3. プレビューの設定をする
            - プレビュー用のエントリーを作る
            -  .previewContextを設定する
    - バインディング用のXXXXWidget.swiftファイルを追加

3. 導入手順で自動作成されたBundleに追加する



## UserDefaultsでAppとデータの共有をさせる（詳しくはReminder参照）
- プロジェクトのターゲット - signing& - +CapabilityからAppGroup(アプリ内の複数のターゲット間で通信とデータ共有をする)を検索してダブルクリック - AppGroupの＋から新しいグループを登録（バンドルID＋なにか）- Extension.entitlementsとProject.entitlementsで一緒のAppGroupが選ばれていることを確認する
- データモデルのSwiftファイルを作る(ターゲットはProjectのみ)
- アプリとウィジェット作る（getTimeline関数のpolicyは.never）
- XXXXAppConstants.swiftファイルを作る(この定数ファイルはアプリとウィジェット間で共有される)
- userdefaultのsuitnameで共通のキーを使用することで値を共有できる



## CoreDataでAppとデータの共有をさせる（詳しくはCoreDataAndWidgetプロジェクト参照）
1. 最初の導入済ませる
2. アプリコンテナとグループの作成
    - プロジェクトのTarget - signing& - +CapabilityからAppGroup(アプリ内の複数のターゲット間で通信とデータ共有をする)を検索してダブルクリック - AppGroupの＋から新しいグループを登録(バンドルID＋なにか) - ExtensionのTargetでもチェックを入れて同じグループを適用させる
    - 自動で作成されたExtension.entitlementsとProject.entitlementsで一緒のAppGroupが選ばれていることを確認する
3. CoreData導入する
    - 新しいグループ作る - 新規作成 - data modelを検索して選択 - targetはプロジェクトとエクステンション両方にチェックマークを入れる（アプリとウィジェットの両方がアクセスできるように）- 名前をつけてCreate
4. アプリグループを使用してメインソースであるコアデータSQLファイル (SQLite ファイル)を作成
    - 定数用のxxxxConstants.swiftファイルを作成（targetはプロジェクトとエクステンション）
    - SwiftファイルCoreDataManager.swiftを作成（targetはプロジェクトとエクステンション）、コンテキストを作成する(詳細はCoreDataAndWidgetApp.swift)
    - xxxxApp.swiftファイルの@mainですべてのサブビューにオブジェクト管理コンテキストを渡す
5. データベースを構築する
    - Grocery.xcdatamodeldでEntityを作成 - Attributesを必要な分作成 
6. Appのビューを作る
    - xxxxView.swiftファイルを作る（targetはプロジェクトのみ）
7. ウィジェット作る
    - 「２つめ以降のウィジェットを１から自分で追加する」の手順と同様
    - getTimelineメソッドにCoreDataのコードを挿入する


## ユーザーがウィジェットに表示されるコンテンツを選択できるようにする（長押しで変更できる）
1. 最初の導入済ませる
2. xxxxIntent.intentdefinitionファイルを作る
    - ファイルの新規作成 - Siri Kit Intentdefinition File - TargetはAppとExtension両方 - xxxxIntent.intentdefinitionって名前で保存
    - 生成されたファイルの左下の＋からNewEnum - 名前を変更して作成 - casesからユーザーに選択させるタイプを好きなだけ作る - DisplayNameは必要に応じて記入
    - 左下の＋からNewIntent - xxxxIntentを作成 - CategoryをDo - Title(入力済み)とDescription
    (任意)を記入 - Intent is eligible for widgetにチェック(Siri 用ではなくウィジェット用に作成しているため)、それ以外をアンチェック 
    - parameter＋でコード中で使用する変数名を追加 - Type(型)を選択する(新しく作ったenumのカスタム型も使用可) - Siri can ask...をアンチェック - defaultの色を決める
3. ウィジェット作る
    - 「２つめ以降のウィジェットを１から自分で追加する」の手順と同様
    - xxxxWidgetTimelineProvider.swiftはIntentTimelineProviderプロトコルに準拠することに注意、getTimelineメソッドも少し特殊(詳細はMasteringWidgetKit/ColorWidget/ColorWidgetTimelineProvider.swift参照)
    - WidgetファイルはIntentConfigurationを使用

###  ユーザーがウィジェットに表示されるコンテンツを選択できるようにする ＋ Intentエクステンション
1. 最初の導入済ませる
2. xxxxIntent.intentdefinitionファイルを作る
    - 基本的には上の２と同じ
    - IntentファイルでEnumではなくType(xxxxConfigration)を追加する
    - CategoryをViewにする
    - Typeを新しく作ったカスタムタイプにする
    - User Can Edit...とOptions are provided...にチェック
3. Intentエクステンションを追加する
    - New - Target - Intents Extensionを検索 - ファイル名はxxxxIntent, StartingPointはNone, IncludeUI...のチェックは外す, Embed...はプロジェクトを選択
    - xxxxIntent.intentdefinitionファイルのターゲットにIntentExtensionを追加する
4. Intentハンドラー
    - Intentハンドラーを自動生成されたxxxxConfigrationIntentHandlingプロトコルに準拠させる

###  ユーザーの歩数を取得する
1. 最初の導入済ませる、グループ作成する
2. モーション使用の説明(ユーザーに許可を得る時のダイアログに表示されるやつ)とIPリストを追加する
Appのtarget - Info - Privacy - Motion Usage Descriptionを追加 - Using motion to count steps等の説明文を追加
3. 歩数計のデータモデル作る
4. 歩数データを管理してデータを取得するManagerクラス作る
5. 定数ファイル作る
6. App用のビューを作る
7. ウィジェット作る

###  ライブアクティビティ
- AppのフォルダとWidgetのフォルダを追加
- xxxxAttributes.swiftファイルを追加、ActivityKitをインポートしてAppとWidgetで共有したいデータ型を定義
- bundlebについかするときはこれ
```Swift
if #available(iOS 16.1, *){
            FocusTimerLiveWidget()
        }
```
- AppのTargetのinfoにports Live Activitiesを追加して値をYESにする


###  ダイナミックアイランド
- Widgetファイルでビューを構成するよ


///歩数計のデータモデル


## memo
- ユーザーが選択できるサイズを決めたい時
  ```Swift
  struct HelloStaticWidget: Widget {
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "amatnug.amatnug.WidjetTestProject", provider: HelloWidgetTimelineProvider()) { _ in
            HelloWidjetView()
        }
        .supportedFamilies([.systemSmall])
    }
  }
```

