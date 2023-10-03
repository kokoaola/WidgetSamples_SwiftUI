//
//  PizzaOrderAttributes.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/03.
//

import ActivityKit
import SwiftUI


//ライブ アクティビティで表示する画像のイメージ名
enum OrderStatus: String, CaseIterable, Codable, Equatable{
    case received = "takeoutbag.and.cup.and.straw.fill"
    case inProgress = "hourglass"
    case inOven = "flame.fill"
    case onTheWay = "car.fill"
}


struct PizzaOrderAttributes: ActivityAttributes{

    struct ContentState: Codable, Hashable{
        var status: OrderStatus = .received
    }
    
    var orderNumber: Int
    var orderedItem: String
}
