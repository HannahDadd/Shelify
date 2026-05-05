//
//  GhostView.swift
//  Shelify
//
//  Created by Hannah Dadd on 05/05/2026.
//

import SwiftUI

struct GhostView: View {
    @State private var ghosts: [Ghost] = []
    let screenSize = UIScreen.main.bounds.size
    let ghostTypes = [
        "ghostly": GlobalVariables.ghostlyGhostQuotes,
        "sid": GlobalVariables.sidGhostQuotes,
        "margerie": GlobalVariables.margerieGhostQuotes,
        "gilly": GlobalVariables.gillyGhostQuotes,
        "gramp": GlobalVariables.grampGhostQuotes
    ]

    var body: some View {
        VStack {
            ForEach(ghosts) { ghost in
                Image(ghost.imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .position(ghost.position)
                    .opacity(ghost.isVisible ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: ghost.position)
            }
        }
        .onAppear {
            spawnGhost()
        }
    }
    
    func spawnGhost() {
        let startPosition = randomPoint()
        let ghostType = ghostTypes.randomElement()

        let ghost = Ghost(position: startPosition, imageName: ghostType?.key ?? "", comments: ghostType?.value ?? [])
        if ghosts.contains(where: { $0.imageName == ghost.imageName }) { return }
        ghosts.append(ghost)
        
        guard let index = ghosts.firstIndex(where: { $0.id == ghost.id }) else { return }
        animateGhost(at: index)

        // Remove after some time
        let lifetime = Double.random(in: 8...20)
        DispatchQueue.main.asyncAfter(deadline: .now() + lifetime) {
            if index < ghosts.count {
                withAnimation {
                    ghosts[index].isVisible = false
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    ghosts.removeAll { $0.id == ghost.id }
                }
            }
        }
    }
    
    func animateGhost(at index: Int) {
        guard index < ghosts.count else { return }

        let moveDuration = Double.random(in: 2...6)
        let nextPosition = randomPoint()

        withAnimation(.linear(duration: moveDuration)) {
            ghosts[index].position = nextPosition
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
