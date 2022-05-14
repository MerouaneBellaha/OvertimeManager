//
//  Employee.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

struct Employee {
    let uuid: UUID
    var entries: [TimeEntry]
    
    let firstName: String
    let lastName: String
    var overtime: Double
}

extension Employee {
    init(firstName: String, lastName: String, overtime: Double) {
        uuid = UUID()
        entries = []
        
        self.firstName = firstName
        self.lastName = lastName
        self.overtime = overtime
    }
}
