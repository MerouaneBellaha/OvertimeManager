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
    
    func didSwapToDeleteEntry(at offsets: IndexSet) {
        deleteEntryForEmployee(at: offsets)
        employeeService.updateEmployee(employee: employee)
    }
    
    private func deleteEntryForEmployee(at offsets: IndexSet) {
        self.objectWillChange.send()
        
        guard let index = offsets.first else { return }
        employee.overtime -= employee.entries[index].overtime
        employee.entries.remove(atOffsets: offsets)
    }
}
