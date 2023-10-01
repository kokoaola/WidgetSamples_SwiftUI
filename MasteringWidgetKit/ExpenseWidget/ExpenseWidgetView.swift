//
//  ExpenseWidgetView.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/30.
//

import SwiftUI
import WidgetKit

struct ExpenseWidgetView: View {
    let category: ExpenseCategory
    var body: some View {
        switch category {
        case .all:
            ExpenseItemView(label: "Total Expense", amount: 5300, budget: 6000, color: .blue)
        case .food:
            ExpenseItemView(label: "Food Expense", amount: 600, budget: 800, color: .orange)
        case .grocery:
            ExpenseItemView(label: "Total Expense", amount: 1200, budget: 1400, color: .indigo)
        case .gas:
            ExpenseItemView(label: "Total Expense", amount: 800, budget: 1100, color: .purple)
        case .rent:
            ExpenseItemView(label: "Total Expense", amount: 2700, budget: 2700, color: .mint)
        }
    }
}

struct ExpenseWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExpenseWidgetView(category: .all)
            ExpenseWidgetView(category: .food)
            ExpenseWidgetView(category: .rent)
            ExpenseWidgetView(category: .gas)
            ExpenseWidgetView(category: .grocery)
        }
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }

}
