//
//  EntryFactory.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 15/05/2022.
//

import Foundation

struct EntryFactory {
    static let entries = [
        TimeEntry(date: Date.now, service: .evening, overtime: 5),
        TimeEntry(date: Date.now, service: .lunch, overtime: -2.25)
            ]
    static let entry = TimeEntry(date: Date.now, service: .evening, overtime: 5)
}
