//
//  FocusTimerAppView.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/03.
//

import SwiftUI
import ActivityKit

// フォーカスタイマーアプリのメイン画面を表すView
struct FocusTimerAppView: View{
    // タイマーの名前、フォーカス時間、アクティビティ、タイマーの状態を状態変数として保持
    @State private var timerName = "Focus Timer"
    @State private var focusTime = 20.0
    @State private var activity: Activity<FocusTimerAttributes>? = nil
    @State private var timerSet = false
    
    // ビューの本体
    var body: some View{
        NavigationStack{
            VStack{
                // タイマーが設定されている場合は進行中のメッセージを表示
                if timerSet{
                    Text("Timer in progress!")
                }else{
                    // タイマーの名前を入力
                    TextField("Enter timer name", text: $timerName)
                        .textFieldStyle(.roundedBorder)
                    
                    // フォーカス時間を表示
                    Text("Focus time : \(focusTime.formatted())")
                        .font(.title3)
                    // フォーカス時間を調整するためのステッパー
                    Stepper("Adjust Focus Time", value: $focusTime, in: 10...60, step: 5)
                }
                
                HStack{
                    // タイマーを開始するボタン
                    Button("Start Timer"){
                        startTimer()
                    }
                    // タイマーを停止するボタン
                    Button("Stop Timer"){
                        stopTimer()
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
            }
            .padding()
            .navigationTitle("Focus Timer")
        }
    }
    
    // タイマーを開始する関数
    private func startTimer(){
        // タイマーの属性を定義
        let attributes = FocusTimerAttributes(timerName: timerName)
        // タイマーが終了する時間を定義
        let state = FocusTimerAttributes.ContentState(endTime: Date().addingTimeInterval(60 * focusTime))
        
        // アクティビティをリクエストしてタイマーを設定
        activity = try? Activity<FocusTimerAttributes>.request(attributes: attributes, contentState: state, pushType: nil)
        timerSet = true
    }
    
    // タイマーを停止する関数
    private func stopTimer(){
        // タイマーがすぐに終了することを示す状態を定義
        let state = FocusTimerAttributes.ContentState(endTime: .now)
        
        // アクティビティを終了
        Task{
            await activity?.end(using: state, dismissalPolicy: .immediate)
            timerSet = false
        }
    }
}
