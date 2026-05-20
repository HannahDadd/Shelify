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
            VStack(spacing: 30) {
                Text("Accessibility features actively supported")
                    .font(Font.custom("AbrilFatface-Regular", size: 24, relativeTo: .title))
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
                Text("Accessibility features not applicable")
                    .font(Font.custom("AbrilFatface-Regular", size: 24, relativeTo: .title))
                Text("""
- Captions
- Audio Descriptions
""")
                .font(Font.custom("Bellefair-Regular", size: 18, relativeTo: .body))
            }
            .padding()
        }
    }
}
