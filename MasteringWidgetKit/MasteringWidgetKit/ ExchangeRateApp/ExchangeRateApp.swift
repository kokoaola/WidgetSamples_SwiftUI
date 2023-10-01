//
//  ExchangeRateApp.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/01.
//

import SwiftUI

struct ExchangeRateApp: View {
    @State private var selectedCountry: Country? = nil
    
    var body: some View {
        NavigationStack{
            VStack{
                List(Country.sample){country in
                    CountryListCell(country: country)
                        .onTapGesture {
                            selectedCountry = country
                        }
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .sheet(item: $selectedCountry) { country in
                    CountryExchangeRateView(country: country)
                }
            }
            .navigationTitle("Exchange Rate")
        }
    }
}

struct ExchangeRateApp_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRateApp()
    }
}
