//
//  SprintLiveActivityAttributes.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import ActivityKit
import Foundation

struct SprintLiveActivityAttributes: ActivityAttributes {
    
    public struct ContentState: Codable, Hashable {
        var progress: Double
        var elapsedTime: TimeInterval
        var statusMessage: String
    }
    
    var bookName: String
    var duration: TimeInterval
}
