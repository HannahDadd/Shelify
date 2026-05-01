//
//  ContentView.swift
//  Shelify
//
//  Created by Hannah Dadd on 25/04/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationManager = NavigationManager<HomePageRoute>()
    @State var path = NavigationPath([
        HomePageRoute.sprint,
        HomePageRoute.home
    ])
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                LibraryView()
                MenuBar()
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
                            }
                        })
                case .home:
                    SprintStack(time: 2400, action: {
                        navigationManager.reset()
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
                }
            }
        }
    }
}

enum HomePageRoute {
    case sprint
    case home
    
    case sprintTwentyMins
    case sprintFortyMins
    case sprintOneHr
}
