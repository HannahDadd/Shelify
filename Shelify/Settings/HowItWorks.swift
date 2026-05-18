//
//  HowItWorks.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import SwiftUI

struct HowItWorks: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("How does shelfify work?")
                    .font(Font.custom("AbrilFatface-Regular", size: 34, relativeTo: .title))
                Text("""
Property is hard to come by in this modern era. Luckily, you've stumbled across an abandoned library and all that's missing are the books! How do you add books? Simple. You write. Grow your library by completing writing sprints and adding words to your writing projects and books magically start filling the shelves.

A few ghosts may visit your library- don't worry, they're friendly. Ish. I can't wait to see what you do with the place.
""")
                .font(Font.custom("Bellefair-Regular", size: 18, relativeTo: .body))
                
            }
            .padding()
        }
    }
}
