//
//  GhostView.swift
//  Shelify
//
//  Created by Hannah Dadd on 05/05/2026.
//

import SwiftUI

struct GhostView: View {
    let ghosts = [
        Ghost(imageName: "ghostly", ghostName: "ghostly", comments: GlobalVariables.ghostlyGhostQuotes, size: CGSize(width: 60, height: 80)),
        Ghost(imageName: "sid", ghostName: "sid", comments: GlobalVariables.sidGhostQuotes, size: CGSize(width: 60, height: 70)),
        Ghost(imageName: "margerie", ghostName: "margerie", comments: GlobalVariables.sidGhostQuotes, size: CGSize(width: 60, height: 75)),
        Ghost(imageName: "gilly", ghostName: "gilly", comments: GlobalVariables.sidGhostQuotes, size: CGSize(width: 60, height: 70)),
        Ghost(imageName: "gramp", ghostName: "gramp", comments: GlobalVariables.sidGhostQuotes, size: CGSize(width: 60, height: 85)),
        Ghost(imageName: "paula", ghostName: "paula", comments: GlobalVariables.paulineGhostQuotes, size: CGSize(width: 60, height: 70))
    ]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ForEach(ghosts) { ghost in
                    SingleGhostView(screenSize: geo.size, ghost: ghost)
                }
            }
            .scaledToFill()
        }
    }
}
