//
//  GraphForWriters.swift
//  Shelfify
//
//  Created by Hannah Dadd on 27/07/2026.
//

import SwiftUI
import Charts

struct GraphForWriter: View {
    @State private var dayNumbs: [Int] = []
    @State private var stats: [Stat] = []
    @State private var dayValues: [Int: Int] = [:]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("✨ Your Writing Stats ✨")
                    .font(Font.custom("DynaPuff-Regular", size: 24, relativeTo: .headline))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 12)
                VStack(alignment: .leading, spacing: 8) {
                    Text("All Time Sprints")
                        .font(Font.custom("DynaPuff-Regular", size: 18, relativeTo: .title))
                        .multilineTextAlignment(.leading)
                    Text("You've written a total of \(getWordsWritten()) words across \(stats.count) sprints in the app.")
                        .font(Font.custom("Bellefair-Regular", size: 14, relativeTo: .body))
                    
                    Chart {
                        ForEach(Array(zip(stats.indices, stats)), id: \.0) { index, stat in
                            LineMark(x: .value("", index),
                                     y: .value("Words written", stat.wordsWritten))
                            .foregroundStyle(Color.primary)
                        }
                    }
                    .aspectRatio(1.4, contentMode: .fit)
                    .chartYAxisLabel("Words Written")
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    let monthlyStats = getMonthlyStats()
                    
                    Text("Monthly Sprints")
                        .font(Font.custom("DynaPuff-Regular", size: 18, relativeTo: .title))
                        .multilineTextAlignment(.leading)
                    Text("You've completed \(monthlyStats.count) sprints this month.")
                        .font(Font.custom("Bellefair-Regular", size: 14, relativeTo: .body))
                    
                    Chart {
                        ForEach(Array(zip(monthlyStats.indices, monthlyStats)), id: \.0) { index, stat in
                            BarMark(x: .value("", index),
                                    y: .value("Words written", stat.wordsWritten))
                            .foregroundStyle(Color.primary)
                        }
                    }
                    .aspectRatio(1.4, contentMode: .fit)
                    .chartYAxisLabel("Words Written")
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    let yearlyStats = getYearlyStats()
                    
                    Text("Yearly Sprints")
                        .font(Font.custom("DynaPuff-Regular", size: 18, relativeTo: .title))
                        .multilineTextAlignment(.leading)
                    Text("You've completed \(yearlyStats.count) sprints this year.")
                        .font(Font.custom("Bellefair-Regular", size: 14, relativeTo: .body))
                    
                    Chart {
                        ForEach(Array(zip(yearlyStats.indices, yearlyStats)), id: \.0) { index, stat in
                            LineMark(x: .value("", index),
                                     y: .value("Words written", stat.wordsWritten))
                            .foregroundStyle(Color.primary)
                        }
                    }
                    .aspectRatio(1.4, contentMode: .fit)
                    .chartYAxisLabel("Words Written")
                }
            }
            .padding()
            .onAppear {
                if let data = UserDefaults.standard.data(forKey: UserDefaultNames.stats.rawValue) {
                    if let decoded = try? JSONDecoder().decode([Stat].self, from: data) {
                        stats = decoded
                    }
                }
            }
            //.navigationBarTitle(Text("✨ Your Writing Stats ✨").font(Font.custom("DynaPuff-Regular", size: 24, relativeTo: .headline)))
        }
    }
    
    private func getWordsWritten() -> Int {
        return stats.compactMap { $0.wordsWritten }.reduce(0, +)
    }
    
    private func getMonthlyStats() -> [Stat] {
        let todaysMonth = Calendar.current.dateComponents([.month], from: Date())
        return stats.filter { Calendar.current.dateComponents([.month], from: $0.date) == todaysMonth }
    }
    
    private func getYearlyStats() -> [Stat] {
        let todaysMonth = Calendar.current.dateComponents([.year], from: Date())
        return stats.filter { Calendar.current.dateComponents([.year], from: $0.date) == todaysMonth }
    }
    
//    private func getBestStat(stats: [Stat]) -> Stat? {
//        return stats.max { $0.wordsWritten }
//    }
    
    private func getDaysWriting() -> [Int : Int] {
        let daysOfWeek = stats
            .compactMap { $0.date }
            .map { Calendar.current.component(.day, from: $0) }
        var countDict: [Int:Int] = [:]
        daysOfWeek.map {
            let count = countDict[$0, default: 1]
            countDict[$0] = count + 1
        }
        return countDict
    }
    
    private func getFavouriteDayOfWeek(scores: [Int : Int]) -> String {
        let max = scores.max { $0.value < $1.value }
        return getDayOfWeek(day: max?.key ?? 0)
    }
    
    private func getDayOfWeek(day: Int) -> String {
        if day == 1 {
            return "Mon"
        } else if day == 3 {
            return "Tue"
        } else if day == 4 {
            return "Wed"
        } else if day == 5 {
            return "Th"
        } else if day == 6 {
            return "Fri"
        } else if day == 7 {
            return "Sat"
        } else {
            return "Sun"
        }
    }
}
