# WidgetKit
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
###



2. 
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
