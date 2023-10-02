//
//  PedometerView.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/02.
//

import SwiftUI

struct PedometerView: View {
    //共有用のユーザーデフォルトでアプリグループレベルにあるコンテナを作成または使用する
    //suiteNameにはApp Groupの名前を指定
    //suiteNameを使用することで、ウィジェットとホストアプリ間でUserDefaultsのデータを共有が可能になる
    @AppStorage(PedometerAppConstants.stepsStorageKey, store: UserDefaults(suiteName: PedometerAppConstants.appGroupName))
    private var stepsStorage: Int = 0
    
    
    //歩数計のマネージャー
    @StateObject private var manager = PedometerManager()
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.orange.gradient)
                .frame(width: 300, height: 300)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.gray.gradient.opacity(0.5))
                .frame(width: 250, height: 100)
            
            Text("\(manager.pedometer.steps) steps")
                .font(.custom("Academy Engraved LET", size: 44))
                .foregroundColor(.white)
        }
        
        //ビューが画面に表示されたときに実行
        .onAppear {
            //PedometerManagerのインスタンスが新しいペドメーターデータを取得
            manager.refreshData()
        }
        
        //managerが変更される直前に実行される
        //.objectWillChange:managerの/@Publishedが変更されると送信されるPublisher
        .onReceive(manager.objectWillChange) { _ in
            //stepsStorageはmanager.pedometer.stepsに設定され、新しい歩数が保存される
            stepsStorage = manager.pedometer.steps
            //.reloadPedometerTimelines()を呼び出し、ウィジェットのタイムラインを再読み込み
            PedometerAppConstants.reloadPedometerTimelines()
            print(stepsStorage)
        }
    }
}

struct PedometerView_Previews: PreviewProvider {
    static var previews: some View {
        PedometerView()
    }
}
