//
//  PizzaDeriveryWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/04.
//

import ActivityKit
import SwiftUI
import WidgetKit

/// ReadingSideはカメラの左側、TrailingSideはカメラの右側
/// Minimalのattachedはカメラの左側、detachedはカメラの右側で切り離される（それぞれ別のアプリ）
/// ExpandedViewは大きくなったダイナミックアイランド

struct PizzaDeriveryWidget: Widget{
    var body: some WidgetConfiguration{
        ActivityConfiguration(for: PizzaOrderAttributes.self) { context in
            //コンテキストを使用してステータス内の注文情報を取得
            ///これはロック画面で表示されるビュー
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundStyle(Color.orange.gradient)
                
                VStack{
                    HStack{
                        Text("KOALA Pizza")
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                        
                        Text("\(context.attributes.orderedItem) status")
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        Image(systemName: context.state.status.rawValue)
                            .font(.largeTitle)
                        
                        Text(orderStatusMessage(status: context.state.status))
                            .font(.title3)
                    }
                    .foregroundColor(.white)
                }
                .padding(20)
            }
            
            ///ここからダイナミックアイランドで表示されるUIのビュー
        } dynamicIsland: { context in
            DynamicIsland{
                ///DynamicIslandExpandedRegionはアプリをバックグラウンドに移動させてダイナミックアイランドを長押しで拡張した時のコンテンツ
                //左側のエリアに表示する画像
                DynamicIslandExpandedRegion(.leading){
                    //ここに入れる画像は、ウィジェットエクステンションのAssetsに登録すること
                     Image("KK")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                //中央の一番広いエリアに表示する画像
                DynamicIslandExpandedRegion(.center) {
                    Text(context.attributes.orderedItem)
                }
                //右側のエリアに表示する画像
                DynamicIslandExpandedRegion(.trailing) {
                    Text("#\(context.attributes.orderNumber)")
                        .font(.caption2)
                        .padding()
                }
                //下部のエリアに表示する画像
                DynamicIslandExpandedRegion(.bottom) {
                    HStack(alignment: .bottom, spacing: 0) {
                        Image(systemName: context.state.status.rawValue)
                            .font(.largeTitle)
                        
                        Text(orderStatusMessage(status:context.state.status))
                    }
                    .foregroundColor(.white)
                }
                
                
                ///小さいダイナミックアイランドの左右のコンテンツ
            } compactLeading: {
                Image("KK")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } compactTrailing: {
                Image(systemName: context.state.status.rawValue)
                ///　minimalは切り離されたサークル(アイコンのみ表示)
                ///　別のアプリがライブアクティビティがある場合に使用
            } minimal: {
                Image(systemName: context.state.status.rawValue)
            }
        }
        
    }
    
    private func orderStatusMessage(status: OrderStatus) -> String{
        switch status {
        case .received:
            return "Got the order."
        case .inProgress:
            return "We are workint on it."
        case .inOven:
            return "Pizza is basking in oven!"
        case .onTheWay:
            return "It's ready and on the way!!!"
        }
    }
}
