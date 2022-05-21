//
//  EmployeeStore.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 17/05/2022.
//

import Foundation
import Combine

class EmployeeStore: ObservableObject {
    @Published var employees: [Employee] = []
    
    func deleteEmployee(at offsets: IndexSet) {
        employees.remove(atOffsets: offsets)
    }
    
    func resetOvertimeToZeroForAllEmployees() {
        employees.indices.forEach { employees[$0].overtime = 0 }
    }
    
    func addEmployee(employee: Employee) {
        employees.append(employee)
    }
}
