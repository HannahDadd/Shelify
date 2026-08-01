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
                    NavigationLink(destination: HowItWorks()) {
                        SettingsRow(imageName: "questionmark.app.fill", title: "How the App Works")
                    }
                    NavigationLink(destination: OurOtherApps()) {
                        SettingsRow(imageName: "plus.app.fill", title: "Our Other Apps")
                    }
                    NavigationLink(destination: MeetTheFamily()) {
                        SettingsRow(imageName: "person.fill", title: "Meet the Family")
                    }
                }
                Section {
                    NavigationLink(destination: AccessibilityView()) {
                        SettingsRow(imageName: "accessibility.fill", title: "Accessibility Settings")
                    }
                }
                Section {
                    NavigationLink(destination: PrivacyPolicy()) {
                        SettingsRow(imageName: "lock.fill", title: "Privacy Policy")
                    }
                    NavigationLink(destination: TsAndCsView()) {
                        SettingsRow(imageName: "i.square.fill", title: "Terms of Service")
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
    }
}

struct SettingsRow: View {
    let imageName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(title)
                .font(Font.custom("DynaPuff-Regular", size: 14, relativeTo: .body))
            Spacer()
        }
    }
}
