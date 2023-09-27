//
//  WorkoutView.swift
//  WidjetTestProject
//
//  Created by koala panda on 2023/09/27.
//
import Charts
import SwiftUI

struct WorkoutView: View {
    var workoutData = Workout.sample
    var showLineChart = true
    
    var body: some View {
        VStack{
            Text("Workout Tracker")
                .font(.subheadline)

            Chart(workoutData){workout in
                if showLineChart{
                    AreaMark(x: .value("Day", workout.day), y:.value("Mins", workout.minute))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(Gradient(colors: [.blue.opacity(0.3), .clear]))

                    LineMark(x: .value("Day", workout.day), y:.value("Mins", workout.minute))
                        .interpolationMethod(.catmullRom)

                    PointMark(x: .value("Day", workout.day), y:.value("Mins", workout.minute))
                        .annotation(position:.leading) {
                            Text(workout.minute.formatted())
                                .font(.caption)
                        }
                }else{
                    BarMark(x: .value("Day", workout.day), y:.value("Mins", workout.minute))
                        .foregroundStyle(by: .value("Day", workout.day))
                        .annotation {
                            Text("\(workout.minute) mins")
                                .font(.caption2)
                        }
                }
            }
            .padding()
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorkoutView()
            WorkoutView(showLineChart: false)
        }

    }
}
