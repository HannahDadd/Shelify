//
//  GhostView.swift
//  Shelify
//
//  Created by Hannah Dadd on 05/05/2026.
//

import SwiftUI

struct GhostView: View {
    @Environment(\.displayScale) var displayScale
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
                SingleGhostView(screenSize: UIScreen.current?.bounds.size ?? CGSizeMake(400, 400), ghost: ghost)
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

extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}


extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}
