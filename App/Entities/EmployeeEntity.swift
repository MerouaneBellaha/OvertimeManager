//
//  EmployeeEntity.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation

struct EmployeeEntity: Codable {
    let id: UUID
    var entries: [TimeEntryEntity]
    
    let firstName: String
    let lastName: String
    var overtime: Double
}

extension EmployeeEntity {
    init(firstName: String, lastName: String, overtime: Double) {
        self.id = UUID()
        self.entries = []

        self.firstName = firstName
        self.lastName = lastName
        self.overtime = overtime
    }
}
