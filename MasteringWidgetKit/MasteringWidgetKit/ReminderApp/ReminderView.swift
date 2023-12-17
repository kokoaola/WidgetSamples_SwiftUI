//
//  ReminderView.swift
//  WidjetTestProject
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI


///リマインダーアプリのビュー

struct ReminderView: View {
    @State private var reminders = [Reminder]()
    @State private var newReminder = ""
    
    //共有用のユーザーデフォルト
    //suiteNameにはApp Groupの名前を指定
    //suiteNameを使用することで、ウィジェットとホストアプリ間でUserDefaultsのデータを共有が可能になる
    @AppStorage(ReminderAppConstants.storageKey, store: UserDefaults(suiteName: ReminderAppConstants.appGroupName))
    private var reminderStorage: Int = 0
    
    var body: some View {
        NavigationStack{
            VStack{
                List(reminders){reminder in
                    VStack(alignment: .leading) {
                        Text(reminder.title)
                            .font(.title)
                        
                        Text("Due on: " + reminder.dueOn.formatted(date: .abbreviated, time: .omitted))
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
                
                TextField("Add new reminder", text: $newReminder)
                    .onSubmit {
                        if !newReminder.isEmpty{
                            let reminder = Reminder(title: newReminder, dueOn: Date())
                            
                            reminders.append(reminder)
                            
                            newReminder = ""
                            
                            ///ウィジェット表示用にタスク数をユーザーデフォルトに保存
                            reminderStorage = reminders.count
                            ReminderAppConstants.reloadReminderTimelines()
                            print("reminderStrageは", reminderStorage)
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .navigationTitle("Reminder")
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
