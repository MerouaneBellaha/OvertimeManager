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
    let author: String
    let creationDate: Date
    
    var displayableDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
    
    init (id: UUID = UUID(), date: Date, service: Service, overtime: Double, author: String = "pas", creationDate: Date = Date.now) {
        self.id = id
        self.date = date
        self.service = service
        self.overtime = overtime
        self.author = author
        self.creationDate = creationDate
    }
    
    init (entity: TimeEntryModel) {
        self.id = entity.id
        self.date = entity.date
        self.service = entity.service
        self.overtime = entity.overtime
        self.author = entity.author
        self.creationDate = entity.creationDate
    }
    
    var asEntity: TimeEntryModel {
        TimeEntryModel(id: id,
                        date: date,
                        service: service,
                        overtime: overtime,
                        author: author,
                        creationDate: creationDate)
    }
}

extension Array where Element == TimeEntry {
    var sortByCreationDate: Self {
        self.sorted(by: { $0.creationDate > $1.creationDate })
    }
}
