//
//  TimeEntry.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

struct TimeEntry: Identifiable {
    let id: UUID
    
    let date: Date
    let service: Service
    let overtime: Double
}

extension TimeEntry {
    init (date: Date, service: Service, overtime: Double) {
        self.id = UUID()
        
        self.date = date
        self.service = service
        self.overtime = overtime
    }
}
