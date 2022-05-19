//
//  HomeViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var showModal = false
    
    var employeeStore: EmployeeStore = EmployeeStore()
    private let employeeService: EmployeeService
    
    init(employeeService: EmployeeService = EmployeeService()) {
        self.employeeService = employeeService
        employeeStore.employees = employeeService.getEmployees()
    }
    
    func didSwapToDeleteEmployee(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        
        employeeService.deleteEmployee(employee: employeeStore.employees[index])
        deleteEmployee(at: offsets)
    }
    
    func didTapResetOvertime() {
        resetOvertimeToZeroForAllEmployees()
        employeeService.updateEmployees(employees: employeeStore.employees)
    }
    
    private func deleteEmployee(at offSets: IndexSet) {
        self.objectWillChange.send()
        
        employeeStore.employees.remove(atOffsets: offSets)
    }
    
    private func resetOvertimeToZeroForAllEmployees() {
        self.objectWillChange.send()
        
        employeeStore.employees.indices.forEach { employeeStore.employees[$0].overtime = 0 }
    }
}
