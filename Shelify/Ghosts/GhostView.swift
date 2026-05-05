//
//  GhostView.swift
//  Shelify
//
//  Created by Hannah Dadd on 05/05/2026.
//

import SwiftUI

struct GhostView: View {
    @State private var ghostsOnScreen: [GhostWithPosition] = []
    let ghosts = [
        Ghost(imageName: "ghostly", ghostName: "ghostly", comments: GlobalVariables.ghostlyGhostQuotes, size: 80),
        Ghost(imageName: "sid", ghostName: "sid", comments: GlobalVariables.sidGhostQuotes, size: 70),
        Ghost(imageName: "margerie", ghostName: "margerie", comments: GlobalVariables.sidGhostQuotes, size: 75),
        Ghost(imageName: "gilly", ghostName: "gilly", comments: GlobalVariables.sidGhostQuotes, size: 60),
        Ghost(imageName: "gramp", ghostName: "gramp", comments: GlobalVariables.sidGhostQuotes, size: 85),
        Ghost(imageName: "paula", ghostName: "paula", comments: GlobalVariables.paulineGhostQuotes, size: 70)
    ]

    var body: some View {
        GeometryReader { geo in
            VStack {
                ForEach(ghostsOnScreen) { ghost in
                    Image(ghost.ghost.imageName)
                        .resizable()
                        .frame(width: ghost.ghost.size, height: ghost.ghost.size)
                        .position(ghost.position)
                        .opacity(ghost.isVisible ? 0.4 : 0)
                        .animation(.easeInOut(duration: 1), value: ghost.position)
                        .animation(.easeInOut(duration: 1), value: ghost.isVisible)
                }
            }
            .onAppear {
                startSpawningGhosts(screenSize: geo.size)
            }
        }
    }
    
    func startSpawningGhosts(screenSize: CGSize) {
        func spawnLoop(screenSize: CGSize) {
            let delay = Double.random(in: 1...5)

            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                spawnGhost(screenSize: screenSize)
                spawnLoop(screenSize: screenSize)
            }
        }

        spawnLoop(screenSize: screenSize)
    }
    
    func spawnGhost(screenSize: CGSize) {
        let startPosition = randomPoint(screenSize: screenSize)
        let ghostType = ghosts.randomElement()!

        let ghost = GhostWithPosition(position: startPosition, ghost: ghostType)
        
        if ghostsOnScreen.contains(where: { $0.ghost.imageName == ghost.ghost.imageName }) { return }
        ghostsOnScreen.append(ghost)
        
        guard let index = ghostsOnScreen.firstIndex(where: { $0.id == ghost.id }) else { return }
        animateGhost(at: index, screenSize: screenSize)

        // Remove after some time
        let lifetime = Double.random(in: 8...20)
        DispatchQueue.main.asyncAfter(deadline: .now() + lifetime) {
            if index < ghostsOnScreen.count {
                withAnimation {
                    ghostsOnScreen[index].isVisible = false
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    ghostsOnScreen.removeAll { $0.id == ghost.id }
                }
            }
        }
    }
    
    func animateGhost(at index: Int, screenSize: CGSize) {
        guard index < ghostsOnScreen.count else { return }

        let moveDuration = Double.random(in: 4...10)
        let nextPosition = randomPoint(screenSize: screenSize)
            
        withAnimation(.linear(duration: moveDuration)) {
            ghostsOnScreen[index].position = nextPosition
        }

        let pauseChance = Bool.random()

        let nextStepDelay = moveDuration + (pauseChance ? Double.random(in: 1...3) : 0)

        DispatchQueue.main.asyncAfter(deadline: .now() + nextStepDelay) {
            animateGhost(at: index, screenSize: screenSize)
        }
    }
    
    func randomPoint(screenSize: CGSize) -> CGPoint {
        CGPoint(
            x: CGFloat.random(in: 0...screenSize.width),
            y: CGFloat.random(in: 0...screenSize.height)
        )
    }
}
