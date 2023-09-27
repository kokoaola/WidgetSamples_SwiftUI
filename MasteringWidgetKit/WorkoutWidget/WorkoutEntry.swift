//
//  WorkoutEntry.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/27.
//

import WidgetKit

struct WorkoutEntry: TimelineEntry{
    let date: Date
    let workoutDate:[Workout]
    let widgetFamily: WidgetFamily
}
