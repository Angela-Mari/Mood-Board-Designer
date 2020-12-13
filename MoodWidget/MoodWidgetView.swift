//
//  SwiftUIView.swift
//  MoodWidgetExtension
//
//  Created by Angela George on 12/12/20.
//

import SwiftUI

struct MoodWidgetView: View {
    
    let mood : Mood
    
    var body: some View {
        Text(mood.title)
    }
}

