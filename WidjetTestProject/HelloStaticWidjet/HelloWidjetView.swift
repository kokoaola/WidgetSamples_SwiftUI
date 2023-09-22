//
//  HelloWidjetView.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/22.
//

import SwiftUI
import WidgetKit

struct HelloWidjetView: View {
    var body: some View {
        ZStack{
            ContainerRelativeShape()
                .fill(Color.orange.gradient)
                .padding(10)
            VStack{
                Text("Hello")
                    .font(.title3)
                Text("Koala!")
                    .font(.title2.bold())
                    .foregroundStyle(.indigo.gradient)
            }
        }
    }
}

struct HelloWidjetView_Previews: PreviewProvider {
    static var previews: some View {
        HelloWidjetView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        HelloWidjetView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        HelloWidjetView()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
