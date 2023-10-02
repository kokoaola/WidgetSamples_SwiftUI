//
//  Pedometer.swift
//  MasteringWidgetKit
//
//  Created by koala panda on 2023/10/02.
//
///コアモーションで歩数データを取得する
///1. モーション使用の説明(ユーザーに許可を得る時のダイアログに表示されるやつ)とIPリストを追加する
///Appのtarget - Info - Privacy - Motion Usage Descriptionを追加 - Using motion to count steps等の説明文を追加



///歩数計のデータモデル
///
import Foundation

struct Pedometer{
    var steps: Int
}


