//
//  FamousPlace.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/03.
//

import Foundation
import CoreLocation
import SwiftUI

///データモデル
///
struct FamousPlace: Identifiable{
    let id = UUID()
    var name: String
    var location: CLLocationCoordinate2D
    var image = Image("DT")
}


extension FamousPlace{
    static var data: [FamousPlace]{
        [
            .init(name: "港の見える丘公園", location: CLLocationCoordinate2D(latitude: 35.4408333, longitude: 139.6538888)),
            .init(name: "三笠公園", location: CLLocationCoordinate2D(latitude: 35.2861111, longitude: 139.6736111)),
            .init(name: "秦野中央運動公園", location: CLLocationCoordinate2D(latitude: 35.3802777, longitude: 139.2022222))
        ]
    }
}
