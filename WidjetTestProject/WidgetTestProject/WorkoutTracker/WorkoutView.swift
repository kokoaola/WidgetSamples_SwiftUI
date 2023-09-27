//
//  WorkoutView.swift
//  WidjetTestProject
//
//  Created by koala panda on 2023/09/27.
//
import Charts
import SwiftUI
///ターゲットはエクステンションとプロジェクト両方
///グラフ用のビュー
struct WorkoutView: View {
    // サンプルのワークアウトデータをセット
    var workoutData = Workout.sample
    // 折れ線グラフを表示するかどうかのフラグ
    var showLineChart = true
    
    var body: some View {
        VStack{
            // グラフのタイトルテキストを設定
            Text("Workout Tracker")
                .font(.subheadline)
            
            // チャートコンポーネントを生成、workoutDataを使ってグラフを描画
            Chart(workoutData){workout in
                // showLineChartのフラグで折れ線グラフを表示するかバーチャートを表示するかを決定
                if showLineChart{
                    // エリアマークでエリアを描画、x軸は日、y軸は分
                    AreaMark(x: .value("Day", workout.day), y:.value("Mins", workout.minute))
                        .interpolationMethod(.catmullRom) // 描画方法をカトマルロムスプラインで指定
                        .foregroundStyle(Gradient(colors: [.blue.opacity(0.3), .clear])) // 前景スタイルをグラデーションで指定
                    
                    // ラインマークでラインを描画
                    LineMark(x: .value("Day", workout.day), y:.value("Mins", workout.minute))
                        .interpolationMethod(.catmullRom) // 描画方法をカトマルロムスプラインで指定
                    
                    // ポイントマークでポイントを描画
                    PointMark(x: .value("Day", workout.day), y:.value("Mins", workout.minute))
                        .annotation(position:.leading) { // ポイントの注釈を設定
                            Text(workout.minute.formatted()) // 分をテキストで表示
                                .font(.caption)
                        }
                }else{
                    // バーマークでバーを描画、x軸は日、y軸は分
                    BarMark(x: .value("Day", workout.day), y:.value("Mins", workout.minute))
                        .foregroundStyle(by: .value("Day", workout.day)) // 前景スタイルを日によって変更
                        .annotation { // バーの注釈を設定
                            Text("\(workout.minute) mins") // 分をテキストで表示
                                .font(.caption2)
                        }
                }
            }
            .padding()
        }
    }
}


struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorkoutView()
            WorkoutView(showLineChart: false)
        }

    }
}
