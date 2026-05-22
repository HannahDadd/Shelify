//
//  ContentView.swift
//  Shelify
//
//  Created by Hannah Dadd on 25/04/2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @StateObject private var navigationManager = NavigationManager<HomePageRoute>()
    @State var path = NavigationPath([
        HomePageRoute.sprint
    ])
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ZStack {
                if !reduceMotion {
                    GhostView()
                        .accessibilityHidden(true)
                }
                MenuBar(growAction: {
                    navigationManager.navigate(to: .sprint)
                })
            }
            .background {
                ZStack {
                    BackgroundView()
                        .accessibilityHidden(true)
                    LibraryView()
                        .accessibilityHidden(true)
                }
            }
            .navigationDestination(for: HomePageRoute.self) { route in
                switch route {
                case .sprint:
                    GrowthHompage(
                        sprintTapAction: { sprintDuration in
                            switch sprintDuration {
                            case .twentyMins:
                                navigationManager.navigate(to: .sprintTwentyMins)
                            case .fortyMins:
                                navigationManager.navigate(to: .sprintFortyMins)
                            case .oneHr:
                                navigationManager.navigate(to: .sprintOneHr)
                            case .debug:
                                navigationManager.navigate(to: .sprintDebug)
                            }
                        })
                    
                case .sprintTwentyMins:
                    SprintStack(time: 1200, action: {
                            navigationManager.reset()
                        })
                case .sprintFortyMins:
                    SprintStack(time: 2400, action: {
                        navigationManager.reset()
                    })
                case .sprintOneHr:
                    SprintStack(time: 3600, action: {
                        navigationManager.reset()
                    })
                case .sprintDebug:
                    SprintStack(time: 5, action: {
                            navigationManager.reset()
                        })
                }
            }
        }
    }
}

enum HomePageRoute {
    case sprint
    
    case sprintTwentyMins
    case sprintFortyMins
    case sprintOneHr
    case sprintDebug
}
