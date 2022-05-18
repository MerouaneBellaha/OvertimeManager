//
//  EmployeeViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 15/05/2022.
//

import Foundation

class EmployeeViewModel: ObservableObject {
    
    @Published var showModal = false
    @Published var employee: Employee
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    func deleteEntry(at offSets: IndexSet) {
        self.objectWillChange.send()
        employee.deleteEntry(atOffsets: offSets)
    }
}
