# WidgetKit

## 基礎知識

- 「Timeline（タイムライン）」と「Entry（エントリー）」の違いを簡潔に説明すると：

  - 「Entry（エントリー）」はウィジェットで表示する一つ一つのデータや情報の単位です。たとえば、天気予報ウィジェットの一つのエントリーは「今日の天気」が入ります。
  - 「Timeline（タイムライン）」は、これから表示される複数の「Entry（エントリー）」を時系列に並べたものです。たとえば、天気予報ウィジェットのタイムラインには、「今日の天気」、「明日の天気」、「明後日の天気」などが順に並んでいて、時間が来るとウィジェットに表示されます


## 導入方法
1. プロジェクト選択してNew - Target - Widget Extension検索 - include configuration intentはオフ、live activityもオフ - 名前をつけてCreate - ウィジェットが作成されるのでXCode画面上部のスキームで切り替えて確認してみる

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


### １から自分で追加する（上の作業はしてあること前提で）
1. 新しいフォルダを作る(すべてTargetはプロジェクトではなく、導入ので作ったウィジェットのエクステンションのみにチェックをいれる)
2. 作ったフォルダ内にファイルを作る
   - Swiftのファイルを追加（名前はほにゃほにゃEntry）
  - Swiftのファイルを追加（名前はほにゃほにゃTimelineProvider）
  - SwiftUIのファイルを追加（名前はほにゃほにゃView）
  - Swiftのファイルを追加（名前はほにゃほにゃHelloStaticWidget.swift）
2. 必要なコードを書く
3. Bundleに追加する


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

3. 数字付きリスト3

1. 数字付きリスト1
2. 数字付きリスト2
3. 数字付きリスト3

**太字**、*斜体*、~~取り消し線~~

区切り線
--- 
___
***

```
function test() {
  console.log("notice the blank line before this function?");
}
```

[リンクのテキスト](http://example.com)

>>>>>>Hello World


- [ ] タスク1
- [x] タスク2


```ruby:ファイル名
puts 'The best way to log and share programmers knowledge.'
```

| Head | Head | Head |
| ---- | ---- | ---- |
| Text | Text | Text |
| Text | Text | Text |

> 引用文
> 引用文

:::message
メッセージをここに
:::

:::message alert
警告メッセージをここに
:::

### アコーディオン（トグル）
:::details タイトル
表示したい内容
:::
