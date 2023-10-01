//
//  Contry.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/09/30.
//

import Foundation


struct Country: Identifiable{
    let id = UUID()
    var name: String
    var flag: String
    var currencyCode: String
}


extension Country{
    static var JAPAN: Country{
        .init(name: "Japan", flag: "🇯🇵", currencyCode: "jpy")
    }
    
    static var sample: [Country]{
        [
            .init(name: "United States of America", flag: "🇺🇸", currencyCode: "USD"),
            .init(name: "India", flag: "🇮🇳", currencyCode: "INR"),
            .init(name: "Canada", flag: "🇨🇦", currencyCode: "CAD"),
            .init(name: "Australia", flag: "🇦🇺", currencyCode: "AUD"),
            .init(name: "Mexico", flag: "🇲🇽", currencyCode: "MXN")
        ]
    }
}
