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
            return Employee(firstName: firstName, lastName: lastName, overtime: overtime)
        } else {
            // TODO: - Error handling
            print("Should not create empty Employee")
            return Employee(firstName: firstName, lastName: lastName, overtime: overtime)
        }
    }
    
    func getPopupValidationMessage() -> String {
        "Add \(firstName) \(lastName) with \(overtime.toString()) overtime?"
    }
}
