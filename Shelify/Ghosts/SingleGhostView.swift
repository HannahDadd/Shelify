//
//  SingleGhostVIew.swift
//  Shelify
//
//  Created by Hannah Dadd on 15/05/2026.
//

import SwiftUI

struct SingleGhostView: View {
    @State private var position: CGPoint = CGPoint(x: 100, y: 100)
    @State private var isVisible = false
    let screenSize: CGSize
    let ghost: Ghost
    
    var body: some View {
        Image(ghost.imageName)
            .resizable()
            .frame(width: ghost.size.width, height: ghost.size.height)
            .position(position)
            .opacity(isVisible ? 0.4 : 0)
            .animation(.easeInOut(duration: 1), value: position)
            .animation(.easeInOut(duration: 1), value: isVisible)
            .task {
                await spawnGhost()
            }
    }
    
    func spawnGhost() async {
        while true {
            let delay = Double.random(in: 1...5)
            
            try? await Task.sleep(for: .seconds(delay))
            
            await MainActor.run {
                position = randomPoint()
                isVisible = true
            }
        }
    }
    
    func randomPoint() -> CGPoint {
        CGPoint(
            x: CGFloat.random(in: 8...(screenSize.width - 8)),
            y: CGFloat.random(in: 8...(screenSize.height - 8))
        )
    }
}
