//
//  ExpenseTimelineProvider.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/09/30.
//

import SwiftUI
import WidgetKit


// IntentTimelineProviderを使用する理由は、ユーザーにカテゴリーを選択させるため
struct ExpenseTimelineProvider: IntentTimelineProvider{
    typealias Entry = ExpenseEntry
    // MonthlyExpenseIntentは、ユーザーにカテゴリー選択を許可するために必要
    typealias Intent = MonthlyExpenseIntent
    
    // 選択された構成オプションを適切なExpenseCategoryに変換するヘルパー関数
    //MonthlyExpenseIntentはIntentファイルで設定したユーザーが選べる型
    //ExpenseCategoryはswitch文で使用できる形
    private func category(for config: MonthlyExpenseIntent) -> ExpenseCategory{
        // config.categoryをExpenseCategoryに変換
        switch config.category{
        case .unknown:
            return .all
        case .all:
            return .all
        case .food:
            return .food
        case .grocery:
            return .grocery
        case .gas:
            return .gas
        case .rent:
            return .rent
        }
    }
    
    // プレースホルダーエントリーを生成する。Widgetのスケルトンビューを生成
    func placeholder(in context: Context) -> ExpenseEntry {
        ExpenseEntry(category: .all)
    }
    
    // スナップショットエントリーを生成する。Widgetのプレビュー用
    func getSnapshot(for configuration: MonthlyExpenseIntent, in context: Context, completion: @escaping (ExpenseEntry) -> Void) {
        completion(ExpenseEntry(category: .all))
    }
    
    // タイムラインを生成し、エントリーを設定する。ここで設定されたエントリーがWidgetに表示される
    func getTimeline(for configuration: MonthlyExpenseIntent, in context: Context, completion: @escaping (Timeline<ExpenseEntry>) -> Void) {
        // configurationに基づいて適切なカテゴリーでエントリーを生成
        let entry = ExpenseEntry(category: category(for: configuration))
        // Timelineオブジェクトを作成し、ポリシーとして.neverを設定。これによりこのタイムラインは自動更新されない
        completion(Timeline(entries: [entry], policy: .never))
    }
}

