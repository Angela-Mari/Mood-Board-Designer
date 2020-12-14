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
    
    let decoder = PropertyListDecoder()
    
    
    let fileURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.MoodBoardDesignerGroup")?.appendingPathComponent("test3.jpeg")
    
    
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), title: "placeholder", image1: UIImage(imageLiteralResourceName: "placeholder.jpeg"), image2: "placeholder")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        
        let entry = SimpleEntry(date: Date(), title: moods?[0].title ?? "couldn't get data", image1: UIImage(data: Data(base64Encoded: moods?[0].image1 ?? "couldn't get data")!)!, image2: moods?[0].image2 ?? "couldn't get data")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        
        var entries: [SimpleEntry] = []
        print("get timeline")
        //update widget on a timeline here
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entry : SimpleEntry
            
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            print("start")
            
            //swap if even
            if (hourOffset%2 == 0){
                print("Even")
                entry = SimpleEntry(date: Date(), title: moods?[0].title ?? "couldn't get data", image1: UIImage(data: Data(base64Encoded: moods?[0].image1 ?? "couldn't get data")!)!, image2: moods?[0].image2 ?? "couldn't get data")
            }
            else {
                print("odd")
                entry = SimpleEntry(date: Date(), title: moods?[0].title ?? "couldn't get data", image1: UIImage(data: Data(base64Encoded: moods?[0].image1 ?? "couldn't get data")!)!, image2: moods?[0].image2 ?? "couldn't get data")
            }
            
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let title: String
    let image1: UIImage
    let image2: String
}

struct MoodWidgetEntry1View : View {
    var entry: Provider.Entry

    var body: some View {
        
            VStack {
            Text(entry.title)
                Image(uiImage: entry.image1)
                .resizable()
                .aspectRatio(contentMode: .fit)
            }
            .padding()
            
        
    }
}

@main
struct MoodWidget: Widget {
    let kind: String = "MoodWidget" //title of the file

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MoodWidgetEntry1View(entry: entry)
        }
        .configurationDisplayName("Mood Widget")
        .description("Display your mood boards on your homescreen.")
        .supportedFamilies([.systemSmall])
    }
}

struct MoodWidget_Previews: PreviewProvider {
    static var previews: some View {
        MoodWidgetEntry1View(entry: SimpleEntry(date: Date(), title: "placeholder", image1: UIImage(imageLiteralResourceName: "placeholder.jpeg"), image2: "placeholder"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
