//
//  Date+String.swift
//  MoodTracker
//
//  Created by Wesley Espinoza on 12/15/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import Foundation

extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .short)
    }
}
