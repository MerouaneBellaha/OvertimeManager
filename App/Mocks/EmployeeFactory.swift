//
//  EmployeeFactory.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

struct EmployeeFactory {
    static let employees = [
        Employee(id: UUID(), entries: EntryFactory.entries, firstName: "Pascaline", lastName: "Janvrin", overtime: 2.5),
        Employee(id: UUID(), entries: EntryFactory.entries, firstName: "Bellaha", lastName: "Merouane", overtime: -2.0)]
    static let employee = Employee(id: UUID(), entries: EntryFactory.entries, firstName: "Jeanne", lastName: "Po", overtime: 0)
}
