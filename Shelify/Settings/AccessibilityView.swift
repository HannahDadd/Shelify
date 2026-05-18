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
                Text("What accessibility does Shelfify support?")
                    .font(Font.custom("AbrilFatface-Regular", size: 34, relativeTo: .title))
                Text("""
""")
                .font(Font.custom("Bellefair-Regular", size: 18, relativeTo: .body))
                
            }
            .padding()
        }
    }
}
