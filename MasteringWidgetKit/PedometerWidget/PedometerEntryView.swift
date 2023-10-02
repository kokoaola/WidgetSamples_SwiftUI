//
//  PedometerEntryView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/02.
//

import SwiftUI
import WidgetKit


struct PedometerEntryView: View{
    @Environment(\.widgetFamily) var widgetFamily
    var entry: PedometerEntry
    
    var body: some View{
        switch widgetFamily {
        case .accessoryCircular:
            ZStack{
                Circle().stroke(lineWidth: 4)
                VStack{
                    Image(systemName: "figure.walk")
                    Text("\(entry.steps)")
                }
            }
        default:
            VStack{
                Text("\(entry.steps) steps")
            }
        }
    }
}
