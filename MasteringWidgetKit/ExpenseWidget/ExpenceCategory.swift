//
//  ExpenceCategory.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/29.
//

import Foundation


// ExpenseCategoryは支出のカテゴリを表すenum
enum ExpenseCategory: Int{
    // 各ケースには整数型のRaw Valueが割り当てられる。allは1, 他のケースは順に2, 3, 4, 5となる
    case all = 1
    case food
    case grocery
    case gas
    case rent
    
    // descは各カテゴリに適した説明文字列を返すコンピューテッドプロパティ
    var desc: String{
        // selfの値に応じて異なる文字列を返す
        switch self{
        case .all:
            return "All Expenses"
        case .food:
            return "Food Expenses"
        case .grocery:
            return "Grocery Expenses"
        case .gas:
            return "Gas Expenses"
        case .rent:
            return "Rent Expenses"
        }
    }
}

