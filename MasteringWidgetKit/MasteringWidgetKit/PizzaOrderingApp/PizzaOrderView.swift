//
//  PizzaOrderView.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/03.
//

import SwiftUI
import ActivityKit


struct PizzaOrderView: View{
    // 現在の注文中のライブアクティビティのIDを保持する変数
    @State private var currentID: String = ""
    // 選択されたピザの種類を保持する変数
    @State private var pizzaType: PizzaType = .cheese
    // 注文するピザの数を保持する変数
    @State private var quantity: Int = 1
    
    var body: some View {
        // ナビゲーションスタックの中にコンテンツを配置
        NavigationStack {
            VStack {
                Form {
                    // ピザのタイプを選択するためのピッカー
                    Picker("Pizza Type", selection: $pizzaType) {
                        // PizzaType の全ケースに対してループを回す
                        ForEach(PizzaType.allCases) { pizzaT in
                            // 各ピザの名前を表示
                            Text(pizzaT.rawValue)
                                .tag(pizzaT)
                        }
                    }
                    
                    // ピザの数量を選択するためのステッパー
                    Stepper.init("Quantity", value: $quantity, in: 1...10)
                    
                    // 注文の要約を表示するセクション
                    Section(header: Text("Summary")) {
                        Text("Order \(quantity) Large \(pizzaType.rawValue) Pizza(s)")
                        HStack {
                            Spacer()
                            // 注文ボタン
                            Button("Place order") {
                                placeOrder(orderString: "\(quantity) Large \(pizzaType.rawValue) Pizza(s)")
                            }
                        }
                    }
                    
                    // 現在の注文IDが空でない場合に管理者用のセクションを表示
                    if !currentID.isEmpty {
                        Section(header: Text("Admin Section")) {
                            // 各段階での注文状況を更新するボタン
                            Button("Update order in progress") {
                                updateOrder(with: .inProgress)
                            }
                            .frame(width: 400)
                            
                            Button("Update order in oven") {
                                updateOrder(with: .inOven)
                            }
                            .frame(width: 400)
                            
                            Button("Update order on the way") {
                                updateOrder(with: .onTheWay)
                            }
                            .frame(width: 400)
                            
                            // 注文を完了するボタン
                            Button("Complete order") {
                                orderCompleted()
                            }
                            .frame(width: 400)
                        }
                    }
                }
            }
            .navigationTitle("DevTechie Pizza Shop")
        }
    }
    
    
    /// アクティビティIDを受け取り、ピザ注文属性タイプのアクティビティを返す
    private func getActivity(from id: String) -> Activity<PizzaOrderAttributes>? {
        // 現在のIDと一致するアクティビティを検索
        guard let activity = Activity.activities.first(where: { (activity: Activity<PizzaOrderAttributes>) in
            activity.id == currentID
            // 一致するアクティビティがなければnilを返す
        }) else { return nil }
        return activity
    }
    
    
    /// ピザの注文を行う関数
    //アプリがバックグラウンドにあるときは、ライブ アクティビティを開始できない
    private func placeOrder(orderString: String) {
        // 注文情報を生成
        let pizzaOrderAttrs = PizzaOrderAttributes(orderNumber: Int.random(in: 1000..<8888), orderedItem: orderString)
        
        // 注文状態を設定
        let state = PizzaOrderAttributes.ContentState(status: .received)
        
        do {
            // アクティビティを要求して注文情報を保存
            let activity = try Activity<PizzaOrderAttributes>.request(attributes: pizzaOrderAttrs, contentState: state, pushType: nil)
            currentID = activity.id  // アクティビティIDを保存
        } catch {
            // エラー時の処理
            print(error.localizedDescription)
        }
    }
    
    
    /// 注文状況を更新する関数
    private func updateOrder(with status: OrderStatus) {
        // 現在のアクティビティを取得
        guard let activity = getActivity(from: currentID) else { return }
        
        // 2秒後に以下の処理を実行
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            var updateState = activity.contentState  // 現在の状態を取得
            updateState.status = status  // 注文状態を更新
            
            // 非同期でアクティビティの状態を更新
            Task {
                await activity.update(using: updateState)
            }
        }
    }
    
    /// 注文を完了する関数
    private func orderCompleted() {
        // 現在のアクティビティを取得
        guard let activity = getActivity(from: currentID) else { return }
        
        // 非同期で注文を完了させる
        Task {
            await activity.end(using: activity.contentState, dismissalPolicy: .immediate)
            // アクティビティIDをリセット
            currentID = ""
        }
    }
}
