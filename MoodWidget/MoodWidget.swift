//
//  MoodWidget.swift
//  MoodWidget
//
//  Created by Angela George on 12/12/20.
//

import WidgetKit
import SwiftUI



struct Provider: TimelineProvider {
    let moods = Mood.loadMoodsFromFile()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), title: "placeholder", image1: "image in plist", image2: "image 2 in plist")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        
        let entry = SimpleEntry(date: Date(), title: moods?[0].title ?? "couldn't get data", image1: moods?[0].image1 ?? "couldn't get data", image2: moods?[0].image2 ?? "couldn't get data")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        //update widget on a timeline here
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, title: moods?[0].title ?? "couldn't get data", image1: moods?[0].image1 ?? "couldn't get data", image2: moods?[0].image2 ?? "couldn't get data")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let title: String
    let image1: String
    let image2: String
}

struct MoodWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Text(entry.title)
        }
    }
}

@main
struct MoodWidget: Widget {
    let kind: String = "MoodWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MoodWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct MoodWidget_Previews: PreviewProvider {
    static var previews: some View {
        MoodWidgetEntryView(entry: SimpleEntry(date: Date(), title: "timeline", image1: "image in plist", image2: "image 2 in plist"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
