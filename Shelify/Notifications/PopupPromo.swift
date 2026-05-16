//
//  PopupPromo.swift
//  Shelify
//
//  Created by Hannah Dadd on 16/05/2026.
//

import SwiftUI

struct PopupPromo: View {
    var title: String
    var subtitle: String
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .multilineTextAlignment(.leading)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            Text(subtitle)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .font(.subheadline)
                .foregroundColor(.white)
            VStack {
                EmptyView()
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color.primary)
        .cornerRadius(8)
        .onTapGesture { action() }
        .shadow(radius: 5)
    }
}
