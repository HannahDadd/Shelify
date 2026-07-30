//
//  MenuBar.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import SwiftUI

struct MenuBar: View {
    @State var showSettingsSheet = false
    @State private var showButtons: Bool = false
    let growAction: () -> Void
    let crystalBallAction: () -> Void
    let buttonlength = CGFloat(75)
    
    var body: some View {
        VStack() {
            Spacer()
            HStack {
                VStack(spacing: 16) {
                    Spacer()
                    if showButtons {
                        Button {
                            growAction()
                        } label: {
                            Image("growButton")
                                .resizable()
                                .frame(width: buttonlength, height: buttonlength)
                                .accessibilityLabel("Grow you library")
                        }
                        Button {
                            showSettingsSheet = true
                        } label: {
                            Image("settingsButton")
                                .resizable()
                                .frame(width: buttonlength, height: buttonlength)
                                .accessibilityLabel("Settings")
                        }
                    }
                    Button {
                        showButtons.toggle()
                    } label: {
                        Image("menuButton")
                            .resizable()
                            .frame(width: buttonlength, height: buttonlength)
                            .accessibilityLabel("Menu")
                    }
                }
                .padding()
                Spacer()
                VStack {
                    Spacer()
                    Button {
                        crystalBallAction()
                    } label: {
                        Image("crystal_btn")
                            .resizable()
                            .frame(width: buttonlength, height: buttonlength)
                            .accessibilityLabel("See the Future")
                    }
                    .padding()
                }
            }
        }
        .sheet(isPresented: $showSettingsSheet, content: {
            SettingsView()
        })
    }
}
