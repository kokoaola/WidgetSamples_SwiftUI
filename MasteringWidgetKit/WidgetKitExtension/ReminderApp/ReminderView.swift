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
