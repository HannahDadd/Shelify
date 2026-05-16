//
//  OtherApps.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import SwiftUI

struct OurOtherApps: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Image("WritingGamesPromo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Download Writing Games")
                    .font(Font.custom("AbrilFatface-Regular", size: 34))
                    .multilineTextAlignment(.leading)
                Text("""
                    You look like a really hard-working writer. Fancy taking a break while still working on those writing skills?
                    
                    Writing Games helps you relax and sharpens your writing skills. With games that will teach you new words, practice your editing skills, and daily writing prompts, it's the perfect place for any word nerd to wind down. Whether you want to resolve a conflict or add a zesty new voice to some bland as anything dialogue, Writing Games is the place for you.
                    """)
                    .font(Font.custom("Bellefair-Regular", size: 18))
                    .multilineTextAlignment(.leading)
                StretchedButton(text: "Download now", action: {})
                Image("GetItWritePromo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Download Get it Write")
                    .font(Font.custom("AbrilFatface-Regular", size: 34))
                    .multilineTextAlignment(.leading)
                Text("""
    Get it Write will gamify your creative writing and get those words written.

    Featuring focused writing sprints to help you carve out the time, daily streaks to keep your word count on track, and daily notifications that form a consistent writing habit. Collect achievement badges as you hit author milestones and get detailed stats showing just how consistent you’re becoming.

    Whether you’re drafting your first novel in New York, polishing poetry in London, or journaling in the Highlands, the world is full of storytellers, they just need a place to start. Download Get it Write today, start your first sprint, and get those words written.
    """)
                    .font(Font.custom("Bellefair-Regular", size: 18))
                    .multilineTextAlignment(.leading)
            }
            .padding()
            StretchedButton(text: "Download now", action: {})
        }
    }
}
