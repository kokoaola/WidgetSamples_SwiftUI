//
//  FamousPlaceMapProvider.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/03.
//

import MapKit
import SwiftUI
import WidgetKit

// 有名な場所をマップ上に表示するためのタイムラインプロバイダー
struct FamousPlaceMapProvider: TimelineProvider {
    // 使用するエントリータイプを定義
    typealias Entry = FamousPlaceMapEntry
    
    // プレースホルダーとして表示する内容を提供
    func placeholder(in context: Context) -> FamousPlaceMapEntry {
        FamousPlaceMapEntry(date: Date(), famousPlace: FamousPlace.data[0])
    }
    
    // ウィジェットのスナップショットを提供
    func getSnapshot(in context: Context, completion: @escaping (FamousPlaceMapEntry) -> Void) {
        completion(FamousPlaceMapEntry(date: Date(), famousPlace: FamousPlace.data[0]))
    }
    
    // ウィジェットのタイムラインを提供
    func getTimeline(in context: Context, completion: @escaping (Timeline<FamousPlaceMapEntry>) -> Void) {
        // 有名な場所のデータからランダムに場所を選ぶ
        var randomPlace = FamousPlace.data.randomElement() ?? FamousPlace.data[0]
        
        // その場所の周辺の地域を定義
        let region = MKCoordinateRegion(center: randomPlace.location, latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        // 地域のスナップショットを取るためのスナップショッターを作成
        ///MKMapSnapshotter:MapKit内のクラスで、地図の特定の部分のスタティックなスナップショット（画像）を非同期的に生成する
        let mapSnapshotter = makeSnapshotter(for: region, with: context.displaySize)
        
        // スナップショットの取得を開始
        mapSnapshotter.start { snapshot, error in
            // スナップショットの取得に成功した場合のみ処理を続行
            guard let snapshot = snapshot, error == nil else {return}
            
            let date = Date()
            // 次の更新のための時刻を定義
            let nextUpdate = Calendar.current.date(byAdding: .minute, value: 1, to: date)!
            
            // 生成したスナップショットをUIImageで取り出し、インスタンスの場所のデータにセット
            randomPlace.image = Image(uiImage: snapshot.image)
            
            // エントリーを作成
            let entry = FamousPlaceMapEntry(date: date, famousPlace: randomPlace)
            
            // タイムラインを作成してコールバックに渡す
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
            
            completion(timeline)
        }
    }
    
    // 指定された地域とサイズのためのマップスナップショッターを作成
    private func makeSnapshotter(for region: MKCoordinateRegion, with size: CGSize) -> MKMapSnapshotter {
        let options = MKMapSnapshotter.Options()
        options.region = region
        options.size = size
        
        // ユーザーインターフェースのスタイルを取得して画像をダークモードにするかライトモードにするか決める
        options.traitCollection = UITraitCollection(traitsFrom: [
            options.traitCollection,
            UITraitCollection(userInterfaceStyle: UIScreen.main.traitCollection.userInterfaceStyle)
        ])
        return MKMapSnapshotter(options: options)
    }
}
