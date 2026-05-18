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
            VStack(spacing: 48) {
                Text("You've written \(wordsWritten) words with Shelify")
                    .font(Font.custom("Bellefair-Regular", size: 28, relativeTo: .title))
                    .multilineTextAlignment(.center)
                VStack {
                    Text("Start a focused writing sprint:")
                        .textCase(.uppercase)
                    StartSprintCard(action: { sprintTapAction(.twentyMins) }, text: "20 mins", accessibilityString: "Start a 20 minute sprint")
                    StartSprintCard(action: { sprintTapAction(.fortyMins) }, text: "40 mins", accessibilityString: "Start a 40 minute sprint")
                    StartSprintCard(action: { sprintTapAction(.oneHr) }, text: "1 hour", accessibilityString: "Start a 1 hour sprint")
                }
                NotificationCTA()
                Spacer()
            }
            .padding()
            .navigationTitle("🪴 Grow Your Library 🪴")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

enum SprintDurations {
    case twentyMins
    case fortyMins
    case oneHr
}
