//
//  Workout.swift
//  WidjetTestProject
//
//  Created by koala panda on 2023/09/27.
//
///データモデル
///ターゲットはエクステンションとプロジェクト両方

import Foundation

struct Workout:Identifiable{
    let id = UUID()
    let day: String
    let minute: Int
}


///プレビュー用のサンプル
extension Workout{
    static var sample: [Workout]{
        [
            .init(day: "Mon", minute: Int.random(in: 20..<60)),
            .init(day: "Tue", minute: Int.random(in: 20..<60)),
            .init(day: "Wed", minute: Int.random(in: 20..<60)),
            .init(day: "Thu", minute: Int.random(in: 20..<60)),
            .init(day: "Fri", minute: Int.random(in: 20..<60)),
            .init(day: "Sat", minute: Int.random(in: 20..<60)),
            .init(day: "Sun", minute: Int.random(in: 20..<60))
        ]
    }
}
