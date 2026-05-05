//
//  GhostModel.swift
//  Shelify
//
//  Created by Hannah Dadd on 05/05/2026.
//

import SwiftUI

struct Ghost: Identifiable {
    let id = UUID()
    var position: CGPoint
    var isVisible: Bool = true
    let imageName: String
    let comments: [String]
}
