//
//  CrystalBallView.swift
//  Shelfify
//
//  Created by Hannah Dadd on 30/07/2026.
//

import SwiftUI

struct CrystalBallView: View {
    
    var body: some View {
        VStack {
            Spacer()
            Text("Library completes at 100k words")
                .font(Font.custom("Bellefair-Regular", size: 14, relativeTo: .caption))
                .padding()
                .background(in: .capsule)
        }
        .background {
            ZStack {
                BackgroundView()
                    .accessibilityHidden(true)
                
                VStack {
                    Image("library-21")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottom)
                }
                .ignoresSafeArea()
                .accessibilityHidden(true)
            }
        }
    }
}
