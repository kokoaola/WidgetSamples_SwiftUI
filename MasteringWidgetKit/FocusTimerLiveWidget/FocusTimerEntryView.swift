//
//  FocusTimerEntryView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/03.
//

import SwiftUI
import ActivityKit
import WidgetKit


// タイマーの状態を表示するためのView
struct FocusTimerEntryView: View{
    // タイマーの属性と状態を保持するコンテキスト
    let context: ActivityViewContext<FocusTimerAttributes>
    
    var body: some View{
        ZStack{
            // 背景の四角形をオレンジ色で表示
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange.gradient.opacity(0.5))
            
            HStack{
                // 残り時間をタイマースタイルで表示
                Text(context.state.endTime, style: .timer)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                // タイマーの名前を表示
                Text(context.attributes.timerName)
                    .font(.body)
            }
            .padding(.horizontal)
        }
    }
}
