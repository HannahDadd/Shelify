//
//  GhostView.swift
//  Shelify
//
//  Created by Hannah Dadd on 05/05/2026.
//

import SwiftUI

struct GhostView: View {
    @State var quote = ""
    let ghosts = [
        Ghost(imageName: "ghostly", ghostName: "ghostly", comments: GlobalVariables.ghostlyGhostQuotes, size: CGSize(width: 60, height: 80)),
        Ghost(imageName: "sid", ghostName: "sid", comments: GlobalVariables.sidGhostQuotes, size: CGSize(width: 60, height: 70)),
        Ghost(imageName: "margerie", ghostName: "margerie", comments: GlobalVariables.margerieGhostQuotes, size: CGSize(width: 60, height: 75)),
        Ghost(imageName: "gilly", ghostName: "gilly", comments: GlobalVariables.gillyGhostQuotes, size: CGSize(width: 60, height: 60)),
        Ghost(imageName: "gramp", ghostName: "gramp", comments: GlobalVariables.grampGhostQuotes, size: CGSize(width: 60, height: 85)),
        Ghost(imageName: "paula", ghostName: "paula", comments: GlobalVariables.paulineGhostQuotes, size: CGSize(width: 60, height: 60))
    ]
    
    var body: some View {
        ZStack {
            ForEach(ghosts) { ghost in
                SingleGhostView(screenSize: UIScreen.main.bounds.size, ghost: ghost)
                    .onTapGesture {
                        quote = ghost.comments.randomElement() ?? ""
                    }
            }
            VStack {
                if quote != "" {
                    Text(quote)
                        .containerShape(.rect)
                        .foregroundStyle(.black)
                        .font(Font.custom("Bellefair-Regular", size: 18, relativeTo: .body))
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(.white)
                        .onTapGesture {
                            quote = ""
                        }
                }
                Spacer()
            }
            .padding()
        }
    }
}
