//
//  EmployeeFactory.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

struct EmployeeFactory {
    static let employees = [
        Employee(firstName: "Pascaline", lastName: "Janvrin", overtime: 2.5),
        Employee(firstName: "Bellaha", lastName: "Merouane", overtime: -2.0)]
    static let employee = Employee(firstName: "Jeanne", lastName: "Po", overtime: 0)
}

