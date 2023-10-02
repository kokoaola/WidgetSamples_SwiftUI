//
//  ExchangeRateApp.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/01.
//

import SwiftUI

// アプリケーションのメインビューを定義
struct ExchangeRateApp: View {
    // 選択された国を表す状態変数
    @State private var selectedCountry: Country? = nil
    
    var body: some View {
        NavigationStack{
            VStack{
                // 国のリストを表示するListビュー
                List(Country.sample){country in
                    // 各国を表すセル
                    CountryListCell(country: country)
                    // タップジェスチャーをハンドリング
                        .onTapGesture {
                            // タップされた国をselectedCountryに設定
                            selectedCountry = country
                        }
                    // 行のセパレータを非表示に設定
                        .listRowSeparator(.hidden)
                }
                // リストのスタイルをプレーンに設定
                .listStyle(.plain)
                // 選択された国がある場合、詳細ビューをモーダルで表示
                .sheet(item: $selectedCountry) { country in
                    CountryExchangeRateView(country: country)
                }
            }
            .navigationTitle("Exchange Rate")
            
            /// アプリがURLを受け取った時のハンドラ
            /// アプリがURLを受け取らなかった場合、onOpenURL のクロージャは呼ばれない
            .onOpenURL { url in
                // 受け取ったURLのスキームとホストをチェック
                guard url.scheme == "sample",
                      url.host == "exchangerate" else{
                    return
                }
                
                // 受け取ったURLをログに出力
                print(url.pathComponents)
                // URLのpathComponentsから国の通貨コードを抽出
                // コードに一致する国をselectedCountryに設定 => $selectedCountryが変更されることでsheetが発動して詳細のシートが出現する
                
                //first(where:) メソッドで、コレクション内で条件に一致する最初の要素を検索
                //c がコレクションの各Countryインスタンス
                //url.pathComponents[1] は、onOpenURL で受け取ったURLのパスコンポーネントの配列から、インデックス 1 の要素を取得しています。例えば、URLが sample://exchangerate/USD の場合、url.pathComponents は ["/", "USD" となり、url.pathComponents[1] は "USD" になります。
                
                //したがって、このコードはCountry.sample の中から、currencyCode がURLの第2パスコンポーネント（例："USD"）と一致する最初の Country インスタンスを探し、見つかった場合、それを selectedCountry に設定します。
                selectedCountry = Country.sample.first(where: { c in
                    c.currencyCode == url.pathComponents[1]
                })
            }
        }
    }
}


struct ExchangeRateApp_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRateApp()
    }
}
