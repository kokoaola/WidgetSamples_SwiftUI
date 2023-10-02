//
//  StockView.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/01.
//

import SwiftUI

struct StockView: View {
    // Stateプロパティラッパーを用いて、stock変数を定義。この変数はViewの再描画をトリガーする
    @State var stock: Stock?
    
    var body: some View {
        VStack(alignment: .leading) {
            // stock変数がnilでない場合、stockの情報を表示
            if let stock = stock {
                Text("AAPL")
                    .bold()
                
                // stockの名前をサブヘッドラインのフォントで、セカンダリーカラーで表示
                Text("\(stock.name)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // stockの現在価格をUSDでフォーマットし、タイトル2の太字で表示
                // もし現在価格が前のクローズ価格より低ければ赤、そうでなければ緑で表示
                Text(stock.current.formatted(.currency(code: "USD")))
                    .font(.title2.bold())
                    .foregroundStyle(stock.current < stock.previousClose ? Color.red.gradient : Color.green.gradient)
            } else {
                // stock変数がnilの場合、"Nothing to see here"というテキストを表示
                Text("Nothing to see here")
            }
        }
        // onAppear修飾子を使って、Viewが表示された時の処理を定義
        .onAppear {
            // 非同期タスクを起動してStockServiceから株データを取得
            Task {
                do {
                    // "AAPL"についての株データを非同期に取得
                    let fetchedStock = try await StockService.getStockData(for: "AAPL")
                    // 取得したデータをstate変数にセット
                    stock = fetchedStock
                } catch {
                    // エラーが発生した場合、エラーのローカライズされた説明をコンソールに出力
                    print(error.localizedDescription)
                }
            }
        }
    }
}


struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stock: Stock(stockOpen: 213.20, high: 354.23, low: 342.21, current: 234.20, previousClose: 432.22, name: "ABC.com"))
    }
}
