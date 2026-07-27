//
//  SprintEndPage.swift
//  Get It Write
//
//  Created by Hannah Dadd on 14/02/2026.
//

import SwiftUI

struct SprintEndPage: View {
    @AppStorage(UserDefaultNames.wordsWritten.rawValue) var wordsWritten: Int = 0
    @State var endWordCount: Int = 0
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Sprint Finished!")
                .font(Font.custom("AbrilFatface-Regular", size: 34, relativeTo: .title))
                .padding(.bottom, 16)
            NumberSection(text: "How many words did you write?", response: $endWordCount)
            Spacer()
            StretchedButton(text: "Finish", action: {
                wordsWritten = wordsWritten + endWordCount
                let stat = Stat(id: UUID().hashValue, wordsWritten: endWordCount, date: Date())
                
                // add statistics
                var statsToAppend: [Stat] = []
                let encoder = JSONEncoder()
                if let data = UserDefaults.standard.data(forKey: UserDefaultNames.stats.rawValue) {
                    if let decoded = try? JSONDecoder().decode([Stat].self, from: data) {
                        statsToAppend.append(contentsOf: decoded)
                    }
                }
                statsToAppend.append(stat)
                if let encoded = try? encoder.encode(statsToAppend) {
                    UserDefaults.standard.set(encoded, forKey: UserDefaultNames.stats.rawValue)
                }
                action()
            })
        }
        .padding()
    }
}
