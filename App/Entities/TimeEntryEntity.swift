//
//  TimeEntryEntity.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation

struct TimeEntryEntity: Codable {
    let id: UUID
    
    let date: Date
    let service: Service
    let overtime: Double
    let author: String
}

extension TimeEntryEntity {
    init (date: Date, service: Service, overtime: Double) {
        self.id = UUID()
        self.author = "Pascaline"

        self.date = date
        self.service = service
        self.overtime = overtime
    }
}
