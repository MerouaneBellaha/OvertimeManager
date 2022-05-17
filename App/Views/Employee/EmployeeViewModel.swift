//
//  EmployeeViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 15/05/2022.
//

import Foundation

class EmployeeViewModel: ObservableObject {
    
    @Published var showModal = false
    
    func deleteEntry(at indexSet: IndexSet, from employee: inout Employee) {
        guard let index = indexSet.first else { return }
        employee.overtime -= employee.entries[index].overtime
        employee.entries.remove(atOffsets: indexSet)
    }
}
