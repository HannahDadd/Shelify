//
//  MeetTheFamily.swift
//  Shelfify
//
//  Created by Hannah Dadd on 31/07/2026.
//

import SwiftUI

struct MeetTheFamily: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Text("Meet the Family")
                    .font(Font.custom("DynaPuff-Regular", size: 34, relativeTo: .title))
                    .multilineTextAlignment(.center)
                Image("family_photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                MeetTheGhost(name: "Gilly", imageName: "gilly", desc: "Gilly loves reading. Her ghostly singing is a little creepy though.")
                MeetTheGhost(name: "Sid", imageName: "sid", desc: "Sid is too cool for school. He likes books, but he won't be telling anyone that.")
                MeetTheGhost(name: "Paula", imageName: "paula", desc: "Paula lives for books. The chunkier, the better.")
                MeetTheGhost(name: "Gramp", imageName: "gramp", desc: "He's a little grumpy on the outside, but he's a big old softy really.")
                MeetTheGhost(name: "Margerie", imageName: "margerie", desc: "She just wants to make sure you're looking after yourself during those long writing sessions.")
                MeetTheGhost(name: "Wizley", imageName: "ghostly", desc: "Some say a spell gone wrong left him a ghost...")
            }
            .padding()
        }
    }
}

struct MeetTheGhost: View {
    let name: String
    let imageName: String
    let desc: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            Text(name)
                .font(Font.custom("DynaPuff-Regular", size: 22, relativeTo: .title))
                .multilineTextAlignment(.leading)
            Text(desc)
            .font(Font.custom("Bellefair-Regular", size: 14, relativeTo: .body))
            
        }
        .padding()
    }
}
