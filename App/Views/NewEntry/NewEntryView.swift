//
//  NewEntryView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 16/05/2022.
//

import SwiftUI

struct NewEntryView: View {
    
    @ObservedObject var viewModel: NewEntryViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Set a new time entry") {
                FormRowView(text: "date: \(viewModel.selectedDate.toString)") {
                    Spacer()
                    Button(viewModel.showDatePickerButtonLabel) {
                        viewModel.showDatePicker.toggle()
                    }
                }
                
                if viewModel.showDatePicker { datePickerView }
                
                servicePicker
                
                FormRowView(text: "Heures: " + viewModel.overtime.toString()) {
                    OvertimeStepperView(overtime: $viewModel.overtime)
                }
            }
            
            Section(content: {}, footer: {
                HStackTwoButtonsView(
                    left: .init(title: "dismiss", action: { dismiss() }),
                    right: .init(title: "add", action: { viewModel.showPopup.toggle() })
                )
                .confirmationSheet(isPresented: $viewModel.showPopup,
                                   message: viewModel.getPopupValidationMessage(),
                                   action: {
                    viewModel.addEntry()
                    dismiss()
                })
            })
        }
    }
}
//
//struct NewEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewEntryView(viewModel: NewEntryViewModel(employee: EmployeeFactory.employee))
//    }
//}

extension NewEntryView {
    var datePickerView: some View {
        DatePicker("",
                   selection: $viewModel.selectedDate,
                   displayedComponents: [.date])
        .datePickerStyle(WheelDatePickerStyle())
        .labelsHidden()
    }
    
    var servicePicker: some View {
        Picker("service", selection: $viewModel.service) {
            ForEach(Service.allCases, id: \.self) {
                Text($0.description)
            }
        }
        .pickerStyle(.segmented)
    }
}
