//
//  GroceryTimelineProvider.swift
//  CoredataAndWidgetExtensionExtension
//
//  Created by koala panda on 2023/09/28.
//

import WidgetKit
import SwiftUI

// TimelineProviderプロトコルを採用する構造体GroceryTimelineProviderを定義
struct GroceryTimelineProvider:TimelineProvider{
    // Entry型としてGroceryEntryを使用
    typealias Entry = GroceryEntry
    
    
    // placeholderメソッドでデフォルトのGroceryEntryを返す、Widgetのプレビュー表示に使われる
    func placeholder(in context: Context) -> GroceryEntry {
        GroceryEntry()
    }
    
    // getSnapshotメソッドでデフォルトのGroceryEntryを返す、Widgetの静的なビューの表示に使われる
    func getSnapshot(in context: Context, completion: @escaping (GroceryEntry) -> Void) {
        completion(GroceryEntry())
    }
    
    // getTimelineメソッドで指定されたWidgetファミリーサイズに基づいてフェッチするアイテムの数を決定し、タイムラインを取得
    func getTimeline(in context: Context, completion: @escaping (Timeline<GroceryEntry>) -> Void) {
        // Itemのフェッチリクエストを作成
        let request = Item.fetchRequest()
        // fetchOffsetを0に設定して、最初からのアイテムをフェッチ
        request.fetchOffset = 0
        
        // Widgetのファミリーサイズに応じてフェッチするアイテムの数を設定
        switch context.family{
        case .systemSmall:
            request.fetchLimit = 3
        case .systemMedium:
            request.fetchLimit = 4
        case .systemLarge:
            request.fetchLimit = 9
        default:
            request.fetchLimit = 1
        }
        
        do{
            // フェッチリクエストを使用してアイテムをフェッチ
            let items = try CoreDataManager.shared.managedObjectContext.fetch(request)
            // フェッチしたアイテムを使用してGroceryEntryを作成し、それを含むタイムラインを作成。ポリシーは.neverで、手動でのみ更新
            completion(Timeline(entries: [GroceryEntry(items: items)], policy: .never))
        }catch{
            // エラーが発生した場合はエラー内容を出力
            print(error.localizedDescription)
        }
    }
}

