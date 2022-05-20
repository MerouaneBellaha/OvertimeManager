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
    
    private let employeeRepository: EmployeeRepository
    
    init(employeeService: EmployeeRepository = EmployeeRepository()) {
        self.employeeRepository = employeeService
        employeeStore.employees = employeeService.getEmployees()
    }
    
    func didSwapToDeleteEmployee(at offsets: IndexSet) {
        self.objectWillChange.send()
        
        guard let index = offsets.first else { return }
        
        employeeRepository.deleteEmployee(employee: employeeStore.employees[index])
        employeeStore.deleteEmployee(at: offsets)
    }
    
    func didTapResetOvertime() {
        self.objectWillChange.send()

        employeeStore.resetOvertimeToZeroForAllEmployees()
        employeeRepository.updateEmployees(employees: employeeStore.employees)
    }
}
