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
        SimpleEntry(date: Date(), title: "placeholder", image1: "placeholder", image2: "placeholder")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        
        let entry = SimpleEntry(date: Date(), title: moods?[0].title ?? "couldn't get data", image1: moods?[0].image1 ?? "couldn't get data", image2: moods?[0].image2 ?? "couldn't get data")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        print("get timeline")
        //update widget on a timeline here
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: 2, to: currentDate)!
            print("start")
            var newImage1 : String = moods?[0].image1 ?? "couldn't get data"
            var newImage2 : String = moods?[0].image2 ?? "couldn't get data"
            
            //swap if even
            if (hourOffset%2 == 0){
                print(hourOffset%2)
                print("even")
                newImage1 = moods?[0].image2 ?? "couldn't get data"
                newImage2 = moods?[0].image1 ?? "couldn't get data"
            }
            
            let entry = SimpleEntry(date: entryDate, title: moods?[0].title ?? "couldn't get data", image1: newImage1, image2: newImage2)
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
            Text(entry.title)
            Image(entry.image1)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }.padding()
    }
}

@main
struct MoodWidget: Widget {
    let kind: String = "MoodWidget" //title of the file

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
        MoodWidgetEntryView(entry: SimpleEntry(date: Date(), title: "timeline", image1: "placeholder", image2: "placeholder"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
