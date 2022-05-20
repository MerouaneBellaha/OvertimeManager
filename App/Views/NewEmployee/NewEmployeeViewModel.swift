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
    @Published var showConfirmationSheet = false
    
    private let employeeStore: EmployeeStore
    private let employeeRepository: EmployeeRepository = EmployeeRepository()

    init(employeeStore: EmployeeStore) {
        self.employeeStore = employeeStore
    }
    
    func getConfirmationSheetMessage() -> String {
        "Add \(firstName) \(lastName) with \(overtime.toString()) overtime?"
    }
    
    func didTapAddEmployeeConfirmation() {
        let newEmployee = createEmployee()
        employeeRepository.saveEmployee(employee: newEmployee) { result in
            switch result {
            case true: print("employee saved")
            case false: print("error saving employee")
            }
        }
        employeeStore.addEmployee(employee: newEmployee)
    }
    
    private func createEmployee() -> Employee {
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
}
