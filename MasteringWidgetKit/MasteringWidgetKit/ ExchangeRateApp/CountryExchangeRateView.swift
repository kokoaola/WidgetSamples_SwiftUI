//
//  CountryExchangeRateView.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/01.
//

import SwiftUI

struct CountryExchangeRateView: View {
    var country: Country
    @State private var currentRate = 0.0
    
    var body: some View {
        VStack{
            Text("\(country.flag) \(country.name)")
                .font(.largeTitle)
            
            HStack {
                VStack {
                    HStack {
                        Text(Country.JAPAN.flag)
                        Text(Country.JAPAN.currencyCode)
                    }
                    Text(100.0.formatted(.currency(code: Country.JAPAN.currencyCode)))
                }
                
                Spacer()
                
                Image(systemName: "arrow.left.arrow.right")
                
                Spacer()
                
                VStack {
                    HStack {
                        Text(country.currencyCode)
                        Text(country.flag)
                    }
                    Text(currentRate.formatted(.currency(code: country.currencyCode)))
                }
            }
            .font(.largeTitle)
            .onAppear{
                Task{
                    do{
                        let exchangeRate = try await ExchangeRateService().getCurrentRate(from: Country.JAPAN.currencyCode)
                        var stringRate = "0.0"
                        switch country.name{
                        case "USD":
                            stringRate = exchangeRate.USD
                        case "INR":
                            stringRate = exchangeRate.INR
                        case "CAD":
                            stringRate = exchangeRate.CAD
                        case "AUD":
                            stringRate = exchangeRate.AUD
                        case "MXN":
                            stringRate = exchangeRate.MXN
                        default:
                            stringRate = exchangeRate.USD
                        }
                        
                        currentRate = (Double(stringRate) ?? 0.0) * 100.0 
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .padding()
    }
}

struct CountryExchangeRateView_Previews: PreviewProvider {
    static var previews: some View {
        CountryExchangeRateView(country: Country.sample[1])
    }
}
