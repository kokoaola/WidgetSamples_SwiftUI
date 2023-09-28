//
//  ExpenseEntry.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/29.
//

import SwiftUI
import WidgetKit


struct ExpenseEntry: TimelineEntry{
    let date = Date()
    let category: ExpenseCategory
}
