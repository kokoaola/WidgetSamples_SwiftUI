//
//  CoreDataAndWidgetApp.swift
//  CoreDataAndWidget
//
//  Created by koala panda on 2023/09/28.
//

import SwiftUI

@main
//アプリ内でCoreData使用できるようにオブジェクトコンテキストの管理を環境変数として渡す
struct CoreDataAndWidgetApp: App {
    var body: some Scene {
        //コンテンツビューの直後のウィンドウグループ内で、そこからオブジェクトコンテキストを管理できるようになる
        let managedContext = CoreDataManager.shared.managedObjectContext
        WindowGroup {
            //作成されたすべてのサブビュー(ContentViewの後続のビュー)にオブジェクト管理コンテキストを直接渡す
            ContentView()
                .environment(\.managedObjectContext, managedContext)
        }
    }
}
