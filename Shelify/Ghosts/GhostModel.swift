//
//  GhostModel.swift
//  Shelify
//
//  Created by Hannah Dadd on 05/05/2026.
//

import SwiftUI

struct Ghost: Identifiable {
    let id = UUID()
    let imageName: String
    let ghostName: String
    let comments: [String]
    let size: CGSize
}
