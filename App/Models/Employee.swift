//
//  Employee.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

struct Employee: Identifiable {
    let id: UUID
    var entries: [TimeEntry]
    
    let firstName: String
    let lastName: String
    var overtime: Double
    let creationDate = Date()
}

extension Employee {
    init(firstName: String, lastName: String, overtime: Double) {
        self.id = UUID()
        self.entries = []

        self.firstName = firstName
        self.lastName = lastName
        self.overtime = overtime
    }
}

extension Employee {
    var displayableName: String { lastName + " " + firstName }
}

extension Array where Element == Employee {
    var sortByLastName: Self {
        self.sorted(by: { $0.lastName < $1.lastName })
    }
}
