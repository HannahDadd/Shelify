//
//  RainView.swift
//  Shelify
//
//  Created by Hannah Dadd on 29/04/2026.
//

import SwiftUI

struct RainDrop: Identifiable {
    let id = UUID()
    let xPosition: CGFloat
    let delay: Double
    let duration: Double
    let size: CGFloat
}

struct RainView: View {
    @State private var animate = false
    
    let drops: [RainDrop] = (0..<100).map { _ in
        RainDrop(
            xPosition: CGFloat.random(in: 0...UIScreen.main.bounds.width),
            delay: Double.random(in: 0...2),
            duration: Double.random(in: 1...2),
            size: CGFloat.random(in: 5...8)
//            size: CGFloat.random(in: 2...5)
        )
    }
    
    var body: some View {
        ZStack {
            VStack {
                Image("rain")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            ForEach(drops) { drop in
                Capsule()
                    .fill(Color.gray.opacity(0.7))
                    .frame(width: drop.size, height: drop.size)
                    .position(x: drop.xPosition, y: animate ? UIScreen.main.bounds.height : -10)
                    .opacity(animate ? 0 : 1)
                    .animation(
                        Animation.linear(duration: drop.duration)
                            .delay(drop.delay)
                            .repeatForever(autoreverses: false),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }
}
