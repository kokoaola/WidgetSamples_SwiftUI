//
//  WorkoutWidget.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/27.
//

import SwiftUI
import WidgetKit

struct WorkoutWidget: Widget{
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "amatnug.amatnug.WorkoutWidget", provider: WorkoutTimelineProvider()) { entry in
            //表示させるビュー
            WorkoutView(workoutData: entry.workoutDate,
                        showLineChart: entry.widgetFamily == .systemMedium)
        }
        .supportedFamilies([.systemLarge, .systemMedium])
        .configurationDisplayName("Workout Tracker")
        .description("Widget to display weekly workout in chart.")
    }
}
