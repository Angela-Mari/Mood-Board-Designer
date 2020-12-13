//
//  SwiftUIView.swift
//  MoodWidgetExtension
//
//  Created by Angela George on 12/12/20.
//

import SwiftUI

struct MoodWidgetView: View {
    
    @AppStorage("mood", store: UserDefaults(suiteName: "group.MoodBoardDesignerGroup"))
    var moodData: Data = Data()
    
    
    let mood : Mood
    
    var body: some View {
        Text(mood.title)
    }
}
