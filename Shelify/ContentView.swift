//
//  ContentView.swift
//  Shelify
//
//  Created by Hannah Dadd on 25/04/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RainView()
//            VStack {
//                Image("day")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            }
            VStack {
                Image("library-20")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .ignoresSafeArea()
//            VStack(alignment: .trailing) {
//                Text("Words written: 1000")
//                    .padding()
//                    .background(.yellow)
//                    .foregroundStyle(.white)
//                    .font(.headline)
//                Spacer()
//                Text("+")
//                    .padding()
//                    .background(.yellow)
//                    .foregroundStyle(.white)
//                    .font(.headline)
//                
//            }
        }
    }
}
