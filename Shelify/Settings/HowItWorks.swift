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
            VStack(alignment: .leading, spacing: 30) {
                Text("How it works?")
                    .font(Font.custom("DynaPuff-Regular", size: 34, relativeTo: .title))
                    .multilineTextAlignment(.leading)
                Text("""
Property is hard to come by in this modern era. Luckily, you've stumbled across an abandoned library and all that's missing are the books! Grow your library by completing writing sprints and adding words to your writing projects.

A few ghosts may visit your library- tap them for encouragment. 

I can't wait to see what you do with the place.
""")
                .font(Font.custom("Bellefair-Regular", size: 18, relativeTo: .body))
                
            }
            .padding()
        }
    }
}
