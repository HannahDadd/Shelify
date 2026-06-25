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
    @Environment(\.widgetFamily) private var family
    var entry: Provider.Entry
    
    var body: some View {
        Image(getAssetName())
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea(edges: .all)
    }
    
    func getAssetName() -> String {
        switch family {
        case .systemSmall:
            return "smallWidget_\(entry.assettName)"
        case .systemMedium:
            return "mediumWidget_\(entry.assettName)"
        default:
            return "smallWidget_6"
        }
    }
}

struct ShelfifyWidgets: Widget {
    let kind: String = "ShelfifyWidgets"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ShelfifyWidgetsEntryView(entry: entry)
        }
        .contentMarginsDisabled()
        .configurationDisplayName("Shelfify Widget")
        .supportedFamilies([
            .systemSmall,
            .systemMedium
        ])
        .description("Widgets to keep you writing.")
    }
}
