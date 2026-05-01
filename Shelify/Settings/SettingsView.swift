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
                NavigationLink("Privacy Policy", destination: PrivacyPolicy())
                NavigationLink("Daily reminder notification", destination: PrivacyPolicy())
                Spacer()
                NavigationLink("Privacy Policy", destination: PrivacyPolicy())
                NavigationLink("Terms of Service", destination: TsAndCsView())
                VStack(alignment: .leading, spacing: 8) {
                    Text("Want to contact us?")
                    Text("Email: getitwrite@gmail.com")
                }
            }
            .listStyle(.insetGrouped)
            .navigationBarTitle("Settings")
        }
    }
}
