//
//  GhostModel.swift
//  Shelify
//
//  Created by Hannah Dadd on 05/05/2026.
//

import SwiftUI

struct GhostWithPosition: Identifiable {
    let id = UUID()
    var position: CGPoint
    var isVisible: Bool = true
    let ghost: Ghost
}

struct Ghost {
    let imageName: String
    let ghostName: String
    let comments: [String]
    let size: CGFloat
}
