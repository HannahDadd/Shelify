//
//  Sprint.swift
//  Get It Write
//
//  Created by Hannah Dadd on 08/08/2025.
//

import SwiftUI

struct SprintView: View {
    @State var quoteNumber = 0
    let index = Int.random(in: 1...3)
    let endState: () -> Void
    let time: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            CountdownTimer(timeRemaining: time, endState: {
                endState()
            }, textSize: 120, timeRemainingAction: { timeRemaining in
                if timeRemaining.isMultiple(of: 600) {
                    quoteNumber = Int.random(in: 1..<(GlobalVariables.inspiringQuotes.count-1))
                }
            })
            Spacer()
            Spacer()
            Text("\(GlobalVariables.inspiringQuotes[quoteNumber])")
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .font(Font.custom("DynaPuff-Regular", size: 28, relativeTo: .title))
            Spacer()
            StretchedButton(text: "End Sprint Early", action: { endState() })
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            VStack {
                Image("sprint_bg_\(index)")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottom)
            }
            .ignoresSafeArea()
        }
    }
}
