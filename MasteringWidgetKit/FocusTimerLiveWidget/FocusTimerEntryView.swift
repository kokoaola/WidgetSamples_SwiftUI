//
//  FocusTimerEntryView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/03.
//

import SwiftUI
import ActivityKit
import WidgetKit


struct FocusTimerEntryView: View{
    let context: ActivityViewContext<FocusTimerAttributes>
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange.gradient.opacity(0.5))
            
            HStack{
                Text(context.state.endTime, style: .timer)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text(context.attributes.timerName)
                    .font(.body)
            }
            .padding(.horizontal)
        }
    }
}
