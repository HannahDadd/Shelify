//
//  ShelfifyWidgets.swift
//  ShelfifyWidgets
//
//  Created by Hannah Dadd on 08/06/2026.
//

import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let assettName: String
}

struct ShelfifyWidgetsEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Image(entry.assettName)
    }
}

struct ShelfifyWidgets: Widget {
    let kind: String = "ShelfifyWidgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ShelfifyWidgetsEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ShelfifyWidgetsEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Shelfify Widget")
        .supportedFamilies([
            .systemMedium
        ])
        .description("Widgets to keep you writing.")
    }
}
