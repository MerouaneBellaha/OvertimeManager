//
//  NewEmployeeViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation
import SwiftUI

class NewEmployeeViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var overtime: Double = 0
    @Published var showPopup = false
    
    func createEmployee() -> Employee {
        if !firstName.isEmpty, !lastName.isEmpty {
            let newEntry = TimeEntry(date: .now, service: .lunch, overtime: overtime)
            return Employee(entries: [newEntry], firstName: firstName, lastName: lastName, overtime: overtime)
        } else {
            // TODO: - Error handling
            print("Should not create empty Employee")
            let newEntry = TimeEntry(date: .now, service: .lunch, overtime: overtime)
            return Employee(entries: [newEntry], firstName: firstName, lastName: lastName, overtime: overtime)
        }
    }
    
    func getPopupValidationMessage() -> String {
        "Add \(firstName) \(lastName) with \(overtime.toString()) overtime?"
    }
}
