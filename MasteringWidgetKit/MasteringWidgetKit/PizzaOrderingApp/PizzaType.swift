//
//  PizzaType.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/03.
//

import Foundation

///
///CaseIterableに準拠するとfor文で使用できるようになる
enum PizzaType: String, Identifiable, CaseIterable{
    case cheese = "Cheese"
    case chicken = "Chicken"
    case hawaiian = "Hawaiian"
    case neapolitan = "Neapolitan"
    case chicago = "Chicago"
    case newYork = "New York"
    case sicilian = "Sicilian"
    case greek = "Greek"
    case california = "California"
    
    var id: UUID {
        return UUID()
    }
}
