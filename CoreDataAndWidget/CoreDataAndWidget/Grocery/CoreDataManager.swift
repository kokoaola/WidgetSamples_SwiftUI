//
//  CoreDataManager.swift
//  CoreDataAndWidget
//
//  Created by koala panda on 2023/09/28.
//

import CoreData
import Foundation

// CoreDataManagerクラスの定義。CoreDataの管理を担う
final class CoreDataManager {
    // CoreDataManagerのシングルトンインスタンス
    static let shared = CoreDataManager()
    
    // 外部からの初期化を防ぐためのprivateイニシャライザ
    private init() {}
    
    // プライベートな永続コンテナを作成。アプリ内で一つのデータベースを保持する
    private let persistentContainer: NSPersistentContainer = {
        // AppグループコンテナのURLを指定し、SQLiteのデータベースファイルの場所を決定
        //コンテナ（Appグループ）レベルで共有するので、パスコンポーネントはGrocery.xcdatamodeldと同じ名前
        let storeURL = GroceryConstants.appGroupContainerURL.appendingPathComponent("Grocery.sqlite")
        
        // "Grocery"という名前でNSPersistentContainerを生成
        //永続コンテナーはCoreDataのデータモデル名を受け取る
        let container = NSPersistentContainer(name: "Grocery")
        // 指定したURLに永続ストアを設定
        container.persistentStoreDescriptions = [NSPersistentStoreDescription(url: storeURL)]
        
        // 指定されたURLに永続ストアが存在するか確認し、存在すればロード、存在しなければ作成
        container.loadPersistentStores { storeDesc, error in
            if let error = error as? NSError {
                // エラーが存在したらその内容をコンソールに出力
                print(error.localizedDescription)
            }
        }
        // 初期化が完了したコンテナを返す
        return container
    }()
    
    //管理オブジェクト コンテキストを作成
    //削除、編集、追加などの変更を加えるためのコンテキスト
    var managedObjectContext: NSManagedObjectContext {
        // 永続コンテナのviewContextを返す。これはメインスレッドで使用する
        persistentContainer.viewContext
    }
    
    // 保存のための別の管理オブジェクトコンテキストを生成。これはバックグラウンドでの保存作業用
    var managedObjectContextForSaving: NSManagedObjectContext {
        // privateQueueConcurrencyTypeを使用し、親コンテキストにmanagedObjectContextを設定
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.parent = managedObjectContext
        // 初期化したコンテキストを返す
        return context
    }
    
    // 管理オブジェクトコンテキストに変更があれば、それを保存するメソッド
    func saveContext() {
        // コンテキストの変更を同期的に保存
        managedObjectContext.performAndWait {
            if managedObjectContext.hasChanges {
                do {
                    // エラーが発生せずに保存ができれば、そのまま処理を終了
                    try managedObjectContext.save()
                } catch {
                    // エラーが発生したらその内容をコンソールに出力
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // 渡された作業用コンテキストを保存し、その後親のコンテキストも保存するメソッド
    func saveWorkingContext(context: NSManagedObjectContext) {
        do {
            // まず作業用コンテキストを保存
            try context.save()
            // その後親のコンテキストも保存
            saveContext()
        } catch {
            // エラーが発生したらその内容をコンソールに出力
            print(error.localizedDescription)
        }
    }
}


// NSManagedObjectContextの拡張。
//バッチ削除リクエストの実行とその結果のマージを行う
//バッチ削除リクエスト:特定の条件を満たす複数のオブジェクトをSQLから一度に削除するためのリクエスト。メモリ節約のためにオブジェクトをフェッチせずに(メモリにロードせずに)直接データストアから削除する
extension NSManagedObjectContext {
    // バッチ削除リクエストを実行し、その結果を現在のコンテキストにマージするメソッド
    public func executeAndMergeChanges(_ batchDeleteRequest: NSBatchDeleteRequest) throws {
        // 削除されたオブジェクトのIDを結果として取得
        batchDeleteRequest.resultType = .resultTypeObjectIDs
        let result = try execute(batchDeleteRequest) as? NSBatchDeleteResult
        let changes: [AnyHashable: Any] = [NSDeletedObjectsKey : result?.result as? [NSManagedObjectID] ?? []]
        // 削除されたオブジェクトの変更をコンテキストにマージ
        NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [self])
    }
}

