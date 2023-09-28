//
//  GeoceryEntryView.swift
//  CoredataAndWidgetExtensionExtension
//
//  Created by koala panda on 2023/09/28.
//

import SwiftUI
import WidgetKit

struct GroceryEntryView: View{
    let entry: GroceryEntry
    
    var body: some View{
        VStack(alignment: .leading,spacing: 0) {
            HStack{
                Image(systemName: "list.bullet.circle.fill")
                    .foregroundColor(.orange)
                Text("Grocery")
                    .font(.title2)
            }
            
            Rectangle()
                .foregroundStyle(.orange.gradient.opacity(0.4))
                .frame(height: 1)
            
            VStack(alignment: .leading) {
                ForEach(entry.items){item in
                    HStack{
                        Color(hex: item.color ?? "#FF5733")
                            .frame(width:5, height: 20)
                        
                        Text(item.name ?? "")
                            .lineLimit(1)
                    }
                    .font(.subheadline)
                }
            }
            .padding(.top,5)
            Spacer(minLength: 0)
        }
        .padding()
    }
}



struct GroceryEntryView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryEntryView(entry: GroceryEntry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
