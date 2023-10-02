//
//  PedometermManager.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/02.
//

import CoreMotion
import SwiftUI

/// PedometerManagerは歩数データを管理するクラス
final class PedometerManager: ObservableObject {
    // 歩数データを保持するpedometerを公開
    @Published var pedometer = Pedometer(steps: 0)
    
    // 初期化時にデータを取得する
    init() {
        getData()
    }
    
    // データをリフレッシュするためのメソッド
    func refreshData() {
        getData()
    }
    
    
    //MARK: - Private props and methods
    
    
    // Core MotionのCMPedometer(歩行データを取得するためクラス)のインスタンスを保持
    private let cmPedometer: CMPedometer = CMPedometer()
    // ペドメータが利用可能かをチェックする今ピューテッドプロパティ
    private var isPedometerAvailable: Bool {
        //デバイスが歩行イベントの追跡をサポートしているか
        CMPedometer.isPedometerEventTrackingAvailable() &&
        //デバイスが歩行距離の測定をサポートしているか
        CMPedometer.isDistanceAvailable() &&
        //デバイスが歩数の計測をサポートしているか
        CMPedometer.isStepCountingAvailable()
    }
    
    /// ペドメータのデータを取得するメソッド
    private func getData() {
        // ペドメータが利用可能ならデータを取得
        if isPedometerAvailable {
            // 過去24時間のデータを取得するための開始日を計算
            guard let startDate = Calendar.current.date(byAdding: .hour, value: -24, to: Date()) else { return }
            // 開始日から現在までのペドメータデータを問い合わせ
            cmPedometer.queryPedometerData(from: startDate, to: Date()) { [weak self] data, error in
                // エラーがない、そしてデータが存在するなら先に進む
                guard let self = self, let data = data, error == nil else {
                    return
                }
                
                // メインスレッドで歩数を更新（非同期）
                DispatchQueue.main.async {
                    self.pedometer.steps = data.numberOfSteps.intValue
                }
            }
        }
    }
}
