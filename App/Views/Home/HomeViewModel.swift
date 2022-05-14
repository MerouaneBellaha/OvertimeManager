//
//  HomeViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    
    init() {
        employees = getEmployees()
    }
    
    private func getEmployees() -> [Employee] {
        EmployeeFactory.employees
    }
    
    // TODO: - Could be more functionnal? -> return value
    func addEmployee(_ employee: Employee) {
        employees.append(employee)
    }
}
