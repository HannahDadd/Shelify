//
//  MenuBar.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import SwiftUI

struct MenuBar: View {
    @State private var showButtons: Bool = false
    
    var body: some View {
        VStack() {
            Spacer()
            HStack {
                VStack {
                    if showButtons {
                        Image("growButton")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                        Image("settingsButton")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    Image("menuButton")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                        .onTapGesture {
                            showButtons.toggle()
                        }
                }
                Spacer()
            }
        }
    }
}
