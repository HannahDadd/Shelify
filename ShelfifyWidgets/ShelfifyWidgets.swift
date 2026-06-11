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
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea(edges: .all)
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
            .systemSmall
        ])
        .description("Widgets to keep you writing.")
    }
}

extension WidgetConfiguration
{
    func contentMarginsDisabledIfAvailable() -> some WidgetConfiguration
    {
        if #available(iOSApplicationExtension 17.0, *)
        {
            return self.contentMarginsDisabled()
        }
        else
        {
            return self
        }
    }
}
