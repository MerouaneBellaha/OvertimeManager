//
//  TimeEntry.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

class TimeEntry: Identifiable, ObservableObject {
    let id: UUID
    
    let date: Date
    let service: Service
    let overtime: Double
    let author: String
    let creationDate: Date
    
    init (id: UUID = UUID(), date: Date, service: Service, overtime: Double, author: String = "pas", creationDate: Date = Date.now) {
        self.id = id
        self.date = date
        self.service = service
        self.overtime = overtime
        self.author = author
        self.creationDate = creationDate
    }

}
//
//extension TimeEntry {
//    init (date: Date, service: Service, overtime: Double) {
//        self.id = UUID()
//        self.author = "Pascaline"
//        self.creationDate = Date.now
//
//        self.date = date
//        self.service = service
//        self.overtime = overtime
//    }
//}

extension TimeEntry {
    var displayableDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
}

extension Array where Element == TimeEntry {
    var sortByCreationDate: Self {
        self.sorted(by: { $0.creationDate > $1.creationDate })
    }
}
