//
//  SingleGhostVIew.swift
//  Shelify
//
//  Created by Hannah Dadd on 15/05/2026.
//

import SwiftUI

struct SingleGhostView: View {
    @State private var position: CGPoint
    @State private var isVisible = false
    let screenSize: CGSize
    let ghost: Ghost
    
    init(screenSize: CGSize, ghost: Ghost) {
        self.position = CGPoint(
            x: CGFloat.random(in: 60...(screenSize.width - 60)),
            y: CGFloat.random(in: 60...(screenSize.height - 60))
        )
        self.screenSize = screenSize
        self.ghost = ghost
    }
    
    var body: some View {
        Image(ghost.imageName)
            .resizable()
            .frame(width: ghost.size.width, height: ghost.size.height)
            .position(position)
            .opacity(isVisible ? 0.4 : 0)
            .animation(.easeInOut(duration: 10), value: position)
            .task {
                await spawnGhost()
            }
    }
    
    func spawnGhost() async {
        while true {
            try? await Task.sleep(for: .seconds(Double.random(in: 0...12)))
            position = randomPoint()
            await MainActor.run {
                isVisible = true
            }
            
            try? await Task.sleep(for: .seconds(Double.random(in: 10...20)))
            await MainActor.run {
                position = randomPoint()
            }
            
            try? await Task.sleep(for: .seconds(Double.random(in: 8...20)))
            await MainActor.run {
                isVisible = false
            }
        }
    }
    
    func randomPoint() -> CGPoint {
        CGPoint(
            x: CGFloat.random(in: 60...(screenSize.width - 60)),
            y: CGFloat.random(in: 60...(screenSize.height - 60))
        )
    }
}
