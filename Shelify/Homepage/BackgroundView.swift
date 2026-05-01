//
//  BackgroundView.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import SwiftUI

struct BackgroundView: View {
    let index = Int.random(in: 0...3)
    
    var body: some View {
        if index == 0 {
            RainView()
        } else {
            if index == 1 {
                Image("day")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if index == 2 {
                Image("dawn")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if index == 3 {
                Image("night")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
