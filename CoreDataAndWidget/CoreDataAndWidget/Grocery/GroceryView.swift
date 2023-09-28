//
//  GroceryView.swift
//  CoreDataAndWidget
//
//  Created by koala panda on 2023/09/28.
//

import CoreData
import SwiftUI

/// App用のビュー
///
struct GroceryView: View {
    // 現在のCoreDataのコンテキストを取得
    @Environment(\.managedObjectContext) private var managedContext
    // CoreDataからItemエンティティをフェッチして、名前で昇順にソート
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var items: FetchedResults<Item>
    
    // 新しいアイテムの名前を格納
    @State private var newItem = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // アイテムをリスト表示
                List(items, id: \.id) { item in
                    // HStackを使って保存されたアイテムのカラーと名前を横に並べる
                    HStack {
                        // アイテムカラーがnilの時のデフォルトは"#FF5733"
                        Color(hex: item.color ?? "#FF5733")
                            .frame(width: 5, height: 20)
                        
                        // アイテムの名前を表示
                        Text(item.name ?? "")
                    }
                    // リストのセパレータを非表示
                    .listRowSeparator(.hidden)
                }
                // リストのスタイルをplainに設定
                .listStyle(.plain)
                
                Spacer()
                
                // 新しいアイテムの名前を入力するためのテキストフィールド
                TextField("Add new item", text: $newItem)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        //Enterが押されたらアイテムを保存
                        saveNewItem()
                    }
            }
            .padding()
            // ナビゲーションタイトルを設定
            .navigationTitle("DevTechie Grocery")
            // ナビゲーションバーにツールバーアイテムを追加
            .toolbar {
                // ナビゲーションバーの右側に配置するボタン
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Delete All") {
                        // すべてのアイテムを削除する
                        deleteAll()
                    }
                }
            }
        }
    }
    
    // 新しいアイテムを保存する関数
    private func saveNewItem() {
        // newItemが空でなければ実行
        if !newItem.isEmpty {
            // CoreDataの管理オブジェクトコンテキストを取得
            let context = CoreDataManager.shared.managedObjectContext
            
            // 新しいItemオブジェクトを作成
            let item = Item(context: context)
            item.id = UUID()
            item.name = newItem
            // ランダムなカラーコードを設定
            item.color = Color.randomHexColorCode
            
            // 変更を保存
            CoreDataManager.shared.saveWorkingContext(context: context)
            // タイムラインをリロード
            GroceryConstants.reloadGroceryTimelines()
            
            // newItemをリセット（空にする）
            newItem = ""
        }
    }
    
    // すべてのアイテムを削除する関数
    private func deleteAll() {
        // Itemエンティティのフェッチリクエストを作成
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        // バッチ削除リクエストを作成
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        // 削除を試みる
        do {
            try CoreDataManager.shared.managedObjectContext.executeAndMergeChanges(deleteRequest)
            // タイムラインをリロードしてウィジェットも空にする
            GroceryConstants.reloadGroceryTimelines()
        } catch {
            print(error.localizedDescription) // エラーが発生した場合、その内容を印刷
        }
    }
}
