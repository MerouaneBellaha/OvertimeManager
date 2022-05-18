//
//  EmployeeViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 15/05/2022.
//

import Foundation

class EmployeeViewModel: ObservableObject {
    
    @Published var showModal = false
    var employee: Employee
    
    private let employeeService: EmployeeService = EmployeeService()
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    func deleteEntry(at offSets: IndexSet) {
        self.objectWillChange.send()
        employee.deleteEntry(atOffsets: offSets)
        employeeService.updateEmployee(employee: employee)
    }
    
    func updateEmployee(employee: Employee) {
        employeeService.updateEmployee(employee: employee)
    }
}
