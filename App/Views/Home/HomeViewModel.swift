//
//  HomeViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var showModal = false
    
    init() {
        employees = getEmployees()
    }
    
    private func getEmployees() -> [Employee] {
        EmployeeFactory.employees.sortByLastName
    }
    
    func removeEmployee(at offsets: IndexSet) {
        employees.remove(atOffsets: offsets)
    }
    
    func resetOvertimeToZeroForAllEmployees() {
        employees.indices.forEach { employees[$0].overtime = 0 }
    }
}
