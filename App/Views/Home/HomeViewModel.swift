//
//  HomeViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var showModal = false
    @Published var employeeStore: EmployeeStore = EmployeeStore()
    
    func removeEmployee(at offSets: IndexSet) {
        employeeStore.removeEmployee(at: offSets)
    }
    
    func resetOvertimeToZeroForAllEmployees() {
        self.objectWillChange.send()
        employeeStore.resetOvertimeToZeroForAllEmployees()
    }

}
