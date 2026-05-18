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
                action()
            })
        }
        .padding()
    }
}
