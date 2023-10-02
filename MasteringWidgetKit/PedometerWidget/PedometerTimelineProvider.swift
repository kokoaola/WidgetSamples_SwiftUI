//
//  PedometerTimelineProvider.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/02.
//

import SwiftUI
import WidgetKit


struct PedometerTimelineProvider: TimelineProvider{
    typealias Entry = PedometerEntry
    
    
    func placeholder(in context: Context) -> PedometerEntry {
        PedometerEntry(steps: 2323)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PedometerEntry) -> Void) {
        completion(PedometerEntry(steps: 2323))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<PedometerEntry>) -> Void) {
        let defaults = UserDefaults(suiteName: PedometerAppConstants.appGroupName)
        let steps = defaults?.integer(forKey: PedometerAppConstants.stepsStorageKey) ?? 0
        
        completion(Timeline(entries: [PedometerEntry(steps: steps)], policy: .never))
    }
    
    
    
}
