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
        getEmployees()
    }
    
    func deleteEmployee(at offSets: IndexSet) {
        self.objectWillChange.send()
        guard let index = offSets.first else { return }
        employeeService.deleteEmployee(employee: employeeStore.employees[index])
        employeeStore.deleteEmployee(at: offSets)
    }
    
    func resetOvertimeToZeroForAllEmployees() {
        self.objectWillChange.send()
        employeeStore.resetOvertimeToZeroForAllEmployees()
        employeeService.updateEmployees(employees: employeeStore.employees)
    }
    
    func getEmployees() {
        employeeStore.employees = employeeService.getEmployees()
    }
    
    func saveEmployees() {
        employeeService.saveEmployees(employees: employeeStore.employees)
    }
}
