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
    
    init(employeeRepository: EmployeeRepository = EmployeeRepository()) {
        self.employeeRepository = employeeRepository
        
        employeeRepository.getEmployees { result in
            self.objectWillChange.send()
            self.employeeStore.employees = result.sortByLastName
        }
    }
    
    func didSwapToDeleteEmployee(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let id = employeeStore.employees[index].id
        employeeStore.deleteEmployee(at: offsets)
        
        employeeRepository.deleteEmployee(id: id) { result in
            switch result{
            case true: print("employee deleted")
            case false: print("error deleting employee")
            }
        }
        
    }
    
    func didTapResetOvertime() {
        let employeesToUpdate = employeeStore.employees.filter { $0.overtime != 0 }
        if !employeesToUpdate.isEmpty {
            employeeRepository.updateFieldForEmployees(ids: employeesToUpdate.map { $0.id }, field: .overtimeToZero) { result in
                switch result{
                case true: print("employees updated")
                case false: print("error updating employees")
                }
            }
        }
        employeeStore.resetOvertimeToZeroForAllEmployees()
    }
}
