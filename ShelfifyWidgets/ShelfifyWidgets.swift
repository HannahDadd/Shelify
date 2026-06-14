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
    @Environment(\.widgetFamily) private var family
    
    var body: some View {
        Image(entry.assettName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea(edges: .all)
    }
    
    func getAssetName() -> String {
        switch family {
        case .systemSmall:
            return "mediumWidget_\(entry.assettName)"
        case .systemMedium:
            return "smallWidget_\(entry.assettName)"
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
