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
    let creationDate: Date
}
