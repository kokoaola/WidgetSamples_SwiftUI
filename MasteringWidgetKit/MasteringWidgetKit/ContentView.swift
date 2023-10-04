//
//  ContentView.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PizzaOrderView()
//        FocusTimerAppView()
//         PedometerView()
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        ReminderView()
//            .onAppear{
                // asyncとawaitを使用した非同期呼び出しを行うためTaskブロックが必要
//                Task{
//                    do{
//                        let exchangeRate = try await ExchangeRateService().getCurrentRate(from: Country.JAPAN.currencyCode)
//                        print(Country.JAPAN.currencyCode)
//                        print(exchangeRate.result)
////                        print(exchangeRate.USD)
//                    }catch{
//                        print(error.localizedDescription)
//                    }
//                }
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
