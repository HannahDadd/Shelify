//
//  SettingsView.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink("Daily reminder notification", destination: NotificationCTA())
                }
                Section {
                    NavigationLink("How Shelify Works", destination: HowItWorks())
                    NavigationLink("Our Other Apps", destination: OurOtherApps())
                }
                Section {
                    NavigationLink("Privacy Policy", destination: PrivacyPolicy())
                    NavigationLink("Terms of Service", destination: TsAndCsView())
                }
            }
            .listStyle(.insetGrouped)
            .navigationBarTitle("Settings")
        }
    }
}
