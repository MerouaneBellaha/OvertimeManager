//
//  NewEntryViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 16/05/2022.
//

import Foundation

class NewEntryViewModel: ObservableObject {

    @Published var showDatePicker = false {
        didSet { updateShowDatePickerButtonLabel() }
    }
    @Published var selectedDate = Date()
    @Published var service: Service = .lunch
    @Published var overtime: Double = 0.0
    
    @Published var showPopup = false
    var showDatePickerButtonLabel = "show"
    
    private let employee: Employee
    private let updateEmployee: (Employee) -> ()
//    private let employeeService: EmployeeService = EmployeeService()
    
    init(employee: Employee, updateEmployee: @escaping (Employee) -> ()) {
        self.employee = employee
        self.updateEmployee = updateEmployee
    }
    
    func getPopupValidationMessage() -> String {
        "Add new entry; date: \(selectedDate.toString), service: \(service.description) with \(overtime.toString()) overtime?"
    }
    
    func addEntry() {
        let newEntry = createEntry()
        employee.addEntry(entry: newEntry)
        updateEmployee(employee)
//        employeeService.updateEmployee(employee: employee)
    }
    
    private func createEntry() -> TimeEntry {
        TimeEntry(date: selectedDate, service: service, overtime: overtime)
    }
    
    private func updateShowDatePickerButtonLabel() {
        showDatePickerButtonLabel = showDatePicker ? "hide" : "show"
    }
}
