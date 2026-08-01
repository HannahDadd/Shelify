//
//  Stat.swift
//  Shelfify
//
//  Created by Hannah Dadd on 27/07/2026.
//

import Foundation

struct Stat: Encodable, Decodable, Identifiable, Hashable {
    let id: Int
    let wordsWritten: Int
    let date: Date
}
