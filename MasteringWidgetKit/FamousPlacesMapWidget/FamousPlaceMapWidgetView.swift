//
//  FamousPlaceMapWidgetView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/03.
//

import SwiftUI

struct FamousPlaceMapWidgetView: View {
    var entry: FamousPlaceMapEntry
    
    var body: some View {
        ZStack(alignment: .bottom) {
            entry.famousPlace.image
            Text(entry.famousPlace.name)
            
                .foregroundColor(.white)
                .font(.caption.bold())
                .frame(height: 20)
                .frame(maxWidth: .infinity)
                .background(Color.orange.gradient.opacity(0.6))
        }
    }
}
