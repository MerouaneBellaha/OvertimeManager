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
    let employeeAdapter: EmployeeAdapter
    
    init(employeeAdapter: EmployeeAdapter = EmployeeAdapter()) {
        self.employeeAdapter = employeeAdapter
        updateEmployees()
    }
    
    func removeEmployee(at offSets: IndexSet) {
        self.objectWillChange.send()
        employeeStore.removeEmployee(at: offSets)
    }
    
    func resetOvertimeToZeroForAllEmployees() {
        self.objectWillChange.send()
        employeeStore.resetOvertimeToZeroForAllEmployees()
    }
    
    func updateEmployees() {
        employeeStore.employees = employeeAdapter.getEmployees()
    }
}

struct EmployeeAdapter {
    func getEmployees() -> [Employee] {
        EmployeeFactory.employees.sortByLastName
    }
}
