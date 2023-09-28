//
//  ReminderWidgetView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI
import WidgetKit

struct ReminderWidgetView: View{
    let count: Int
    
    var body: some View{
        VStack{
            Text("\(count)")
                .font(.largeTitle)
            
            Text("Reminder\(count > 1 ? "s" : "")")
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.purple.gradient)
    }
}
