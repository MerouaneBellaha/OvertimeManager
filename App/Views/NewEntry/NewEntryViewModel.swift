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
    
    @Published var showConfirmationSheet = false
    var showDatePickerButtonLabel = "show"
    
    private let employee: Employee
    private let employeeService: EmployeeService = EmployeeService()
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    func getConfirmationSheetMessage() -> String {
        "Add new entry; date: \(selectedDate.toString), service: \(service.description) with \(overtime.toString()) overtime?"
    }
    
    func didTapAddEntryConfirmation() {
        addEntryForEmployee()
        employeeService.updateEmployee(employee: employee)
    }
    
    private func addEntryForEmployee() {
        let newEntry = createEntry()
        employee.entries.insert(newEntry, at: 0)
        employee.overtime += newEntry.overtime
    }
    
    private func createEntry() -> TimeEntry {
        TimeEntry(date: selectedDate, service: service, overtime: overtime)
    }
    
    private func updateShowDatePickerButtonLabel() {
        showDatePickerButtonLabel = showDatePicker ? "hide" : "show"
    }
}
