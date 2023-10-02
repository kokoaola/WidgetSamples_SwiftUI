# Mastering WidgetKit in SwiftUI 4, iOS 16 with Dynamic Islandで作ったもの

## MasteringWidgetKitプロジェクト
### SampleWidjet
- 最初に作成するウィジェットの拡張機能。Bundleを持つ
### HelloStaticWidget
 - HelloKoala!の文字をずっと表示させるウィジェット
### TodayWidget
- 今日の日付を表示するウィジェット
### Quotes
- APIで有名人の言葉を表示させるウィジェット
### PhotoWidget
- APIでランダムで画像を取得して表示させるウィジェット
### WeatherWidget
- APIで天気予報を取得して表示させるウィジェット
### WorkoutWidget
- App側とビューを共有してウィジェットに表示させる
### Reminder
- Appとウィジェット間のデータをUserdefaultsで共有する
### ColorWidget
- ユーザーが背景色を決められる動的ウィジェット
- Intent定義ファイルを使用
- TimelineProviderはIntentTimelineProviderを使用することに注意
### ExpenseWidget
- ゲージとユーザーが表示させるウィジェットの内容をを決められる動的ウィジェット
- Intent定義ファイルを使用
- TimelineProviderはIntentTimelineProviderを使用することに注意
### ExchangeRateWidget
- ディープリンク（タップした時に表示させる内容を指定）
### StockWidget
- 株価をAPIで取得するウィジェット
- ゲージとユーザーが表示させるウィジェットの内容をを決められる
- Intent定義ファイルを使用
- TimelineProviderはIntentTimelineProviderを使用することに注意
### Pedometer
- ユーザーが過去 24 時間に実行した歩数を表示するアプリ
- コアモーションで歩数データを取得する


## CoreDataAndWidgetプロジェクト
- App側のコアデータと連動できるウィジェット（合計データ数を取得する）