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
                    .font(Font.custom("DynaPuff-Regular", size: 18, relativeTo: .headline))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                Spacer()
                Text(subtitle)
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Bellefair-Regular", size: 14, relativeTo: .headline))
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
