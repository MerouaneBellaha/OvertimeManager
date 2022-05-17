//
//  EntryFactory.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 15/05/2022.
//

import Foundation

struct EntryFactory {
    static let entries = [
        TimeEntry(id: UUID(), date: Date.now, service: .evening, overtime: 5, author: "ok", creationDate: Date.now - 40000),
        TimeEntry(date: Date.now - 250000, service: .lunch, overtime: -2.25)
            ]
    static let entry = TimeEntry(date: Date.now, service: .evening, overtime: 5)
}
