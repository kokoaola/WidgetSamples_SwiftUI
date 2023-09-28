//
//  ColorWidgetView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/28.
//

import SwiftUI
import WidgetKit

struct ColorWidgetView: View{
    var entry: ColorEntry
    
    private var backColor: Color{
        switch entry.backColor{
        case .mint:
            return .mint
        case .purple:
            return .purple
        case .indigo:
            return .indigo
        case .orange:
            return .orange
        case .pink:
            return .pink
        default:
            return .orange
        }
    }
    
    var body: some View{
        ZStack{
            ContainerRelativeShape()
                .foregroundStyle(backColor.gradient)
                .padding()
            
            Text("長押しで色を変更")
                .foregroundColor(.white)
                .font(.title)
        }
    }
}
