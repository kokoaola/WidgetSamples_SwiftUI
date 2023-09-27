//
//  ReminderView.swift
//  WidjetTestProject
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI

struct ReminderView: View {
    @State private var reminders = [Reminder]()
    @State private var newReminder = ""
    
    var body: some View {
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
                    
                }
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
