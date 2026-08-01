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
    @State private var stats: [Stat] = []
    
    let growAction: () -> Void
    let crystalBallAction: () -> Void
    let statsAction: () -> Void
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
                        if !stats.isEmpty {
                            Button {
                                statsAction()
                            } label: {
                                Image("graph_btn")
                                    .resizable()
                                    .frame(width: buttonlength, height: buttonlength)
                                    .accessibilityLabel("Your Writing Statistics")
                            }
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
        .onAppear {
            if let data = UserDefaults.standard.data(forKey: UserDefaultNames.stats.rawValue) {
                if let decoded = try? JSONDecoder().decode([Stat].self, from: data) {
                    stats = decoded
                }
            }
        }
        .sheet(isPresented: $showSettingsSheet, content: {
            SettingsView()
        })
    }
}
