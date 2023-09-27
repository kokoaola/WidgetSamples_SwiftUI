//
//  PhotoWidgetView.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI
import WidgetKit
//URLは
//https://source.unsplash.com/random/?food
//https://picsum.photos/600

struct PhotoWidgetView: View {
    var entry: PhotoWidtetEntry
    
    var body: some View {
        let path = entry.imageUrl
        
        NetworkImageView(url: URL(string: path)!)
            .scaledToFill()
    }
}

struct PhotoWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = PhotoWidtetEntry(date: Date(), imageUrl: "https://source.unsplash.com/random/?flower")
        PhotoWidgetView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
