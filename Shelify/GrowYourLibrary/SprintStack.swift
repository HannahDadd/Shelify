//
//  SprintStack.swift
//  Get It Write
//
//  Created by Hannah Dadd on 08/08/2025.
//

import SwiftUI
//import SprintLiveActivityExtension

struct SprintStack: View {
    @State private var isSprinting = false
    @State private var timer: Timer? = nil
    @State var viewModel: SprintActivityViewModel?
    
    @State var sprintState: SprintState = .sprint
    
    let time: Int
    let action: () -> Void
    var waitingTime: Int?
    
    var body: some View {
        VStack {
            switch sprintState {
            case .sprint:
                SprintView(endState: {
                    sprintState = .end
                }, time: time)
                .onAppear {
                    startSprint()
                }
            case .end:
                SprintEndPage(action: action)
                    .onAppear {
                        finishSprint()
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .onDisappear {
            cancelSprint()
        }
    }
    
    func startSprint() {
        isSprinting = true
        viewModel = SprintActivityViewModel(duration: TimeInterval(time))
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            viewModel?.elapsedTime += 1
            viewModel?.progress = min((viewModel?.elapsedTime ?? 1) / (viewModel?.duration ?? 1), 1.0)
            viewModel?.updateLiveActivity()
            
            // End sprint when complete
            if viewModel?.elapsedTime ?? 1 >= viewModel?.duration ?? 1 {
                finishSprint()
            }
        }
        
        // Start Live Activity
        viewModel?.startLiveActivity()
    }
    
    func cancelSprint() {
        timer?.invalidate()
        timer = nil
        isSprinting = false
        
        // End Live Activity with success
        viewModel?.endLiveActivity()
    }
    
    func finishSprint() {
        timer?.invalidate()
        timer = nil
        isSprinting = false
        
        // End Live Activity with success
        viewModel?.endLiveActivity(success: true)
    }
}

enum SprintState {
    case sprint
    case end
}
