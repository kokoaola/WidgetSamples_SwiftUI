//
//  Reminder.swift
//  WidjetTestProject
//
//  Created by koala panda on 2023/09/27.
//
///ターゲットはProjectのみ
///

import Foundation

struct Reminder: Identifiable{
    let id = UUID()
    let title: String
    let dueOn: Date
}
