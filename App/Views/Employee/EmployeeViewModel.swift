//
//  EmployeeViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 15/05/2022.
//

import Foundation

class EmployeeViewModel: ObservableObject {
    @Published var employee: Employee
    @Published var showModal = false
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    func removeEntry(at offsets: IndexSet) {
        employee.entries.remove(atOffsets: offsets)
    }
}
