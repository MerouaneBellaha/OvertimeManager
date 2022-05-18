//
//  NewEmployeeView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import SwiftUI

struct NewEmployeeView: View {
    
    @ObservedObject var viewModel = NewEmployeeViewModel()
    @State var employeeStore: EmployeeStore
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section("Set new employee") {
                    FormRowView(text: "Lastname: ") {
                        TextField("lastname", text: $viewModel.lastName)
                    }
                    FormRowView(text: "Firstname: ") {
                        TextField("firstname", text: $viewModel.firstName)
                    }
                    FormRowView(text: "Overtime: " + viewModel.overtime.toString()) {
                        Stepper("",
                                onIncrement: { viewModel.overtime += 0.25 },
                                onDecrement: { viewModel.overtime -= 0.25 }
                        )
                    }
                }
                
                Section(content: {}, footer: {
                    FormButtonsView(onAdd: $viewModel.showPopup, onDismiss: { dismiss() })
                        .confirmationSheet(isPresented: $viewModel.showPopup,
                                           message: viewModel.getPopupValidationMessage(),
                                           action: {
                            let newEmployee = viewModel.createEmployee()
                            employeeStore.insert(newEmployee)
                            dismiss()
                        })
                })
            }
        }
    }
}

struct NewEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        NewEmployeeView(employeeStore: EmployeeStore())
    }
}
