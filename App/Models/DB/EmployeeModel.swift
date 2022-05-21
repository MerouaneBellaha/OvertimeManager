//
//  EmployeeModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation

struct EmployeeModel: Codable {
    let id: UUID
    let entries: [TimeEntryModel]
    let firstName: String
    let lastName: String
    let overtime: Double
    let creationDate: Date
}
