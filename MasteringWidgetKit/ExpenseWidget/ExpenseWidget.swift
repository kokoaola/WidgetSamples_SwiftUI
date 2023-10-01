//
//  ExpenseWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/30.
//

import SwiftUI
import WidgetKit


struct ExpenseWidget: Widget{
    var body: some WidgetConfiguration{
        IntentConfiguration(kind: "amatnug.amatnug.ExpenseWidget", intent: MonthlyExpenseIntent.self, provider: ExpenseTimelineProvider()) { entry in
            ExpenseWidgetView(category: entry.category)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Expense Widget")
        .description("Widget to capture monthly expense.")
    }
}
