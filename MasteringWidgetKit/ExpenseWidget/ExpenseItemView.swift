//
//  ExpenseItemView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/29.
//

import SwiftUI

///ヘルパービュー
///

// ExpenseItemViewは支出項目を表示するためのView構造体
struct ExpenseItemView: View{
    // このViewに表示するラベル、金額、予算、色を定義
    var label: String
    var amount: Double
    var budget: Double
    var color: Color
    
    // bodyはこのViewのコンテンツを定義するプロパティ
    var body: some View{
        // ZStackを使用して複数のViewを重ねて配置
        ZStack{
            // ContainerRelativeShapeを生成し、gradientと透明度を適用して塗りつぶし
            ContainerRelativeShape()
                .fill(color.gradient.opacity(0.6))
            
            // 垂直方向のStackを配置
            VStack{
                // 上部にラベルを配置、テキストは太字
                Text(label)
                    .bold()
                
                // Textの下にSpacerを配置し、余白を作る
                Spacer(minLength: 0)
                
                // ゲージを作成し、範囲は0からbudgetまで、ゲージ内には指定したラベルを配置
                Gauge(value: amount,in: 0...budget) {
                    // 最初の単語だけを抜き出して、フォントサイズを小さくして表示
                    Text(label.split(separator: " ")[0])
                        .font(.caption)
                }currentValueLabel: {
                    // 現在の値をドル表示で、小数点以下は切り捨てて表示
                    Text("\(amount, specifier: "$%.0f")")
                        .font(.footnote)
                }
                // ゲージを2倍の大きさに拡大し、スタイルや色、影を設定
                .scaleEffect(2.0)
                .gaugeStyle(.accessoryCircular)
                .tint(color.gradient)
                .shadow(radius: 1)
                
                // ゲージの下にもSpacerを配置し、余白を作る
                Spacer(minLength: 0)
            }
            // VStack内の全てのViewのテキストカラーを白に設定し、パディングを追加
            .foregroundColor(.white)
            .padding(5)
        }
    }
}

