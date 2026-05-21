//
//  AccessibilityView.swift
//  Shelify
//
//  Created by Hannah Dadd on 18/05/2026.
//

import SwiftUI

struct AccessibilityView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Text("Accessibility features actively supported")
                    .font(Font.custom("AbrilFatface-Regular", size: 34, relativeTo: .title))
                    .multilineTextAlignment(.leading)
                Text("""
- VoiceOver
- Voice Control
- Larger Text
- Dark Interface
- Differentiate Without Color Alone
- Sufficient Contrast
- Reduced Motion
""")
                .font(Font.custom("Bellefair-Regular", size: 18, relativeTo: .body))
                .multilineTextAlignment(.leading)
            }
            .padding()
        }
    }
}
