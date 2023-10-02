//
//  CountryListCell.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/09/30.
//

import SwiftUI


struct CountryListCell: View {
    var country: Country
    
    var body: some View {
        HStack {
            Text(country.flag)
                .font(.title)
                .shadow(radius: 2)
                .padding(.horizontal, 5)
                .background(Color.indigo.gradient.opacity(0.2), in: RoundedRectangle(cornerRadius: 5))
            
            Text(country.name)
            
            Spacer()
            
            Text(country.currencyCode.uppercased())
        }
        .padding()
        .contentShape(Rectangle())
    }
}

struct CountryListCell_Preview: PreviewProvider {
    static var previews: some View {
        CountryListCell(country: Country.JAPAN)
    }
}


