//
//  WeatherView.swift
//  SampleWidjetExtension
//
//  Created by koala panda on 2023/09/26.
//

import SwiftUI

struct WeatherView: View{
    let weater: Weather
    let updateDate: Date
    let backColor: Color
    let showDate: Bool
    
    var body: some View{
        ZStack{
            ContainerRelativeShape()
                .fill(backColor.gradient)
                .padding()
            
            VStack{
                Text(weater.name)
                Text("\(weater.temperature)°\(weater.unit)")
                    .font(.largeTitle.bold())
                Text(WeatherUtil.weatherIcon(by: weater.description))
                Text(weater.description)
                    .font(.caption2)
            }
            .padding()
            
            if showDate{
                VStack{
                    Spacer()
                    Text("Updated: " + updateDate.formatted(date: .omitted, time: .shortened))
                }
                .font(.caption)
            }
        }
    }
}
