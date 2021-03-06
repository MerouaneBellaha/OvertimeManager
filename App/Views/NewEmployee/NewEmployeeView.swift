//
//  NewEmployeeView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import SwiftUI

struct NewEmployeeView: View {
    
    @ObservedObject var viewModel: NewEmployeeViewModel
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
                        OvertimeStepperView(overtime: $viewModel.overtime)
                    }
                }
                
                Section(content: {}, footer: {
                    HStackTwoButtonsView(
                        left: .init(title: "dismiss", action: { dismiss() }),
                        right: .init(title: "add", action: { viewModel.showConfirmationSheet.toggle() })
                    )      
                    .confirmationSheet(isPresented: $viewModel.showConfirmationSheet,
                                       message: viewModel.getConfirmationSheetMessage(),
                                       action: {
                        viewModel.didTapAddEmployeeConfirmation()
                        dismiss()
                    })
                })
            }
        }
    }
}

struct NewEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        NewEmployeeView(viewModel: NewEmployeeViewModel(employeeStore: EmployeeStore()))
    }
}
