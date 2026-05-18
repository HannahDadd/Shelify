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
        Button {
            action()
        } label: {
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
            .background(Color.card)
            .cornerRadius(8)
            .shadow(radius: 5)
        }
    }
}
