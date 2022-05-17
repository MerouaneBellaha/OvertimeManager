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

    private func updateShowDatePickerButtonLabel() {
        showDatePickerButtonLabel = showDatePicker ? "hide" : "show"
    }
    
    func getPopupValidationMessage() -> String {
        "Add new entry; date: \(selectedDate.toString), service: \(service.description) with \(overtime.toString()) overtime?"
    }
    
    func createEntry() -> TimeEntry {
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
