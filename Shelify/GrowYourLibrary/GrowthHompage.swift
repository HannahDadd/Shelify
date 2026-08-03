//
//  RunningSprintCTA.swift
//  Get It Write
//
//  Created by Hannah Dadd on 09/01/2026.
//

import SwiftUI

struct GrowthHompage: View {
    @AppStorage(UserDefaultNames.wordsWritten.rawValue) var wordsWritten: Int = 0
    var sprintTapAction: (SprintDurations) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                Text("🪴 Grow Your Library 🪴")
                    .font(Font.custom("DynaPuff-Regular", size: 24, relativeTo: .headline))
                    .multilineTextAlignment(.center)
                Text("You've written \(wordsWritten) words with Writer's Hollow")
                    .font(Font.custom("Bellefair-Regular", size: 14, relativeTo: .title3))
                    .multilineTextAlignment(.center)
                VStack {
                    Text("Start a focused writing sprint:")
                        .font(Font.custom("Bellefair-Regular", size: 12, relativeTo: .title3))
                        .textCase(.uppercase)
//                    StartSprintCard(action: { sprintTapAction(.debug) }, text: "5 secs [debug only]", accessibilityString: "Start a 20 minute sprint")
                    StartSprintCard(action: { sprintTapAction(.twentyMins) }, text: "20 mins", accessibilityString: "Start a 20 minute sprint")
                    StartSprintCard(action: { sprintTapAction(.fortyMins) }, text: "40 mins", accessibilityString: "Start a 40 minute sprint")
                    StartSprintCard(action: { sprintTapAction(.oneHr) }, text: "1 hour", accessibilityString: "Start a 1 hour sprint")
                }
                NotificationCTA()
                Spacer()
            }
            .padding()
            .frame(alignment: .top)
        }
    }
}

enum SprintDurations {
    case debug
    case twentyMins
    case fortyMins
    case oneHr
}
