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
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottom)
        }
        .ignoresSafeArea()
    }
    
    func getImageName() -> String {
        
        if wordsWritten < 200 {
            return "library-1"
        } else if wordsWritten < 500 {
            return "library-2"
        } else if wordsWritten < 1000 {
            return "library-3"
        } else if wordsWritten < 5000 {
            return "library-4"
        } else if wordsWritten < 10000 {
            return "library-5"
        } else if wordsWritten < 12000 {
            return "library-6"
        } else if wordsWritten < 15000 {
            return "library-7"
        } else if wordsWritten < 20000 {
            return "library-8"
        } else if wordsWritten < 24000 {
            return "library-9"
        } else if wordsWritten < 26000 {
            return "library-10"
        } else if wordsWritten < 28000 {
            return "library-11"
        } else if wordsWritten < 30000 {
            return "library-12"
        } else if wordsWritten < 35000 {
            return "library-13"
        } else if wordsWritten < 37000 {
            return "library-14"
        } else if wordsWritten < 40000 {
            return "library-15"
        } else if wordsWritten < 50000 {
            return "library-16"
        } else if wordsWritten < 55000 {
            return "library-17"
        } else if wordsWritten < 60000 {
            return "library-18"
        } else if wordsWritten < 70000 {
            return "library-19"
        } else if wordsWritten < 80000 {
            return "library-20"
        } else {
            return "library-21"
        }
    }
}
