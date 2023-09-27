//
//  NetworkWidgetView.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.

///リモート画像を非同期的に表示するために使用するビュー
///非同期画像ビューはウィジェットではサポートされていないため、ネットワーク イメージを読み込むための独自のカスタムビューが必要

import SwiftUI

struct NetworkImageView: View{
    let url:URL
    
    var body: some View{
        // URLからデータを取得できた場合の処理
        if let data = try? Data(contentsOf: url),
           // 取得したデータをUIImageとして初期化できた場合の処理
           //コンマを使って複数のオプショナルバインディングを一つの if let 文で行い、複数の条件がすべて true の場合にのみ、ブロック内のコードが実行される
           let uiImage = UIImage(data: data) {
            // UIImageをSwiftUIのImageとして表示し、リサイズ可能に設定する
            Image(uiImage: uiImage).resizable()
        } else {
            // 画像の読み込みに失敗した場合、システムアイコンの"person"を表示する
            Image(systemName: "person")
        }
    }
}
