//
//  LibraryView.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import SwiftUI

struct LibraryView: View {
    @AppStorage(UserDefaultNames.wordsWritten.rawValue) var wordsWritten: Int = 0
    
    var body: some View {
        VStack {
            Image(getImageName())
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .ignoresSafeArea()
    }
    
    func getImageName() -> String {
        return "library-20"
        for i in 1...20 {
            if wordsWritten < (i * 1000) {
                return "library-\(i)"
            }
        }
        return "library-20"
    }
}
