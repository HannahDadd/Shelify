//
//  StartSprintCard.swift
//  Get It Write
//
//  Created by Hannah Dadd on 09/01/2026.
//

import SwiftUI

struct StartSprintCard: View {
    var action: () -> Void
    let text: String
    let accessibilityString: String
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                Text(text)
                    .font(Font.custom("AbrilFatface-Regular", size: 28, relativeTo: .body))
                    .foregroundColor(Color.white)
                    .bold()
                    .multilineTextAlignment(.leading)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.card)
            .cornerRadius(8)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityString)
    }
}
