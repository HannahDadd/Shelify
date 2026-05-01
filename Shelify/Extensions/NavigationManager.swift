//
//  NavigationManager.swift
//  Get It Write
//
//  Created by Hannah Dadd on 22/10/2025.
//

import SwiftUI
import Combine

final class NavigationManager<T: Hashable>: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: T) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func reset() {
        path = NavigationPath()
    }
}
