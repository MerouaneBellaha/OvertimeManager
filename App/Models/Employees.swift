//
//  Employees.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 17/05/2022.
//

import Foundation
import Combine

class EmployeeStore: ObservableObject {
    @Published var employees: [Employee] = []

        init() {
        self.employees = getEmployees()
    }
    
    func resetOvertimeToZeroForAllEmployees() {
        self.objectWillChange.send()
        employees.indices.forEach { employees[$0].overtime = 0 }
    }
    
    func removeEmployee(at offsets: IndexSet) {
        employees.remove(atOffsets: offsets)
    }
    
    private func getEmployees() -> [Employee] {
        EmployeeFactory.employees.sortByLastName
    }
}
