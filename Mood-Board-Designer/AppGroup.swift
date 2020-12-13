//
//  AppGroup.swift
//  Mood-Board-Designer
//
//  Created by Angela George on 12/12/20.
//


// This file creates a URL to the app group container
import Foundation

public enum AppGroup: String {
  case facts = "group.MoodBoardDesignerGroup"

  public var containerURL: URL {
    switch self {
    case .facts:
      return FileManager.default.containerURL(
      forSecurityApplicationGroupIdentifier: self.rawValue)!
    }
  }
}
