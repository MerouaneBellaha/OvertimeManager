//
//  NewEntryViewModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 16/05/2022.
//

import Foundation

class NewEntryViewModel: ObservableObject {
    @Published var employee: Employee
    @Published var showDatePicker = false {
        didSet { updateShowDatePickerButtonLabel() }
    }
    @Published var selectedDate = Date()
    
    @Published var service: Service = .lunch
    @Published var overtime: Double = 0.0
    
    @Published var showPopup = false
    
    var showDatePickerButtonLabel = "show"
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    private func updateShowDatePickerButtonLabel() {
        showDatePickerButtonLabel = showDatePicker ? "hide" : "show"
    }
    
    func getPopupValidationMessage() -> String {
        "Ajouter nouvelle entrée; date: \(selectedDate.toString), service: \(service.description) avec \(overtime.toString()) heures?"
    }
    
    func addEntry() {
        employee.entries.append(createEntry())
        employee.overtime += overtime
    }
    
    private func createEntry() -> TimeEntry {
        TimeEntry(date: selectedDate, service: service, overtime: overtime)
    }
}

extension Date {
    var toString: String {
        var formatter: DateFormatter {
               let formatter = DateFormatter()
               formatter.dateFormat = "dd-MM-yyyy"
               return formatter
           }
        return formatter.string(from: self)
    }
}
