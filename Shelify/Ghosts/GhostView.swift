//
//  GhostView.swift
//  Shelify
//
//  Created by Hannah Dadd on 05/05/2026.
//

import SwiftUI

struct GhostView: View {
    @State private var ghostsOnScreen: [GhostWithPosition] = []
    let screenSize = UIScreen.main.bounds.size
    let ghosts = [
        Ghost(imageName: "ghostly", ghostName: "ghostly", comments: GlobalVariables.ghostlyGhostQuotes, size: 80),
        Ghost(imageName: "sid", ghostName: "sid", comments: GlobalVariables.sidGhostQuotes, size: 70),
        Ghost(imageName: "margerie", ghostName: "margerie", comments: GlobalVariables.sidGhostQuotes, size: 75),
        Ghost(imageName: "gilly", ghostName: "gilly", comments: GlobalVariables.sidGhostQuotes, size: 60),
        Ghost(imageName: "gramp", ghostName: "gramp", comments: GlobalVariables.sidGhostQuotes, size: 85),
        Ghost(imageName: "paula", ghostName: "paula", comments: GlobalVariables.paulineGhostQuotes, size: 70)
    ]

    var body: some View {
        VStack {
            ForEach(ghostsOnScreen) { ghost in
                Image(ghost.ghost.imageName)
                    .resizable()
                    .frame(height: ghost.ghost.size)
                    .position(ghost.position)
                    .opacity(ghost.isVisible ? 0.4 : 0)
                    .animation(.easeInOut(duration: 1), value: ghost.position)
            }
        }
        .onAppear {
            startSpawningGhosts()
        }
    }
    
    func startSpawningGhosts() {
        func spawnLoop() {
            let delay = Double.random(in: 1...5)

            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                spawnGhost()
                spawnLoop()
            }
        }

        spawnLoop()
    }
    
    func spawnGhost() {
        let startPosition = randomPoint()
        let ghostType = ghosts.randomElement()!

        let ghost = GhostWithPosition(position: startPosition, ghost: ghostType)
        ghostsOnScreen.append(ghost)
        
        guard let index = ghostsOnScreen.firstIndex(where: { $0.id == ghost.id }) else { return }
        animateGhost(at: index)

        // Remove after some time
        let lifetime = Double.random(in: 8...20)
        DispatchQueue.main.asyncAfter(deadline: .now() + lifetime) {
            if index < ghosts.count {
                withAnimation {
                    ghostsOnScreen[index].isVisible = false
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    ghostsOnScreen.removeAll { $0.id == ghost.id }
                }
            }
        }
    }
    
    func animateGhost(at index: Int) {
        guard index < ghosts.count else { return }

        let moveDuration = Double.random(in: 4...10)
        let nextPosition = randomPoint()

        withAnimation(.linear(duration: moveDuration)) {
            ghostsOnScreen[index].position = nextPosition
        }

        let pauseChance = Bool.random()

        let nextStepDelay = moveDuration + (pauseChance ? Double.random(in: 1...3) : 0)

        DispatchQueue.main.asyncAfter(deadline: .now() + nextStepDelay) {
            animateGhost(at: index)
        }
    }
    
    func randomPoint() -> CGPoint {
        CGPoint(
            x: CGFloat.random(in: 0...screenSize.width),
            y: CGFloat.random(in: 0...screenSize.height)
        )
    }
}
