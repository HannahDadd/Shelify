//
//  PrivacyPolicy.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import SwiftUI

struct PrivacyPolicy: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("PRIVACY POLICY")
                    .font(Font.custom("AbrilFatface-Regular", size: 34, relativeTo: .title))
                Text("[Our Privacy Policy can be found on our website](https://writingapps5.wordpress.com/privacy-policy-writing-games/)")
                    .font(Font.custom("Bellefair-Regular", size: 18, relativeTo: .body))
            }
            .padding()
        }
    }
}
