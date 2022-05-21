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
    
    private let employeeRepository: EmployeeRepository = EmployeeRepository()
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    func didSwapToDeleteEntry(at offsets: IndexSet) {
        employee.deleteEntry(at: offsets)
        
        employeeRepository.saveEmployee(employee: employee) { result in
            switch result {
            case true: print("entry DELETED")
            case false: print("error uDELETING entry")
            }
        }
    }
}
